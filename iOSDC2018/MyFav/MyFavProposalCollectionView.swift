//
//  MyFavProposalCollectionView.swift
//  iOSDC2018
//
//  Created by 朱　冰一 on 2018/08/15.
//  Copyright © 2018年 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result

protocol MyFavProposalCollectionViewInOut {
    var favProposal: MutableProperty<[FavProposal]> { get }
    var selectProposalAction: Action<Proposal, Proposal, NoError> { get }
}

final class MyFavProposalCollectionView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.isPagingEnabled = true
        view.backgroundColor = .white
        view.register(MyFavProposalCollectionCell.self, forCellWithReuseIdentifier: MyFavProposalCollectionCell.description())
        return view
    }()
    
    var selectProposalAction: Action<Proposal, Proposal, NoError> = { Action { SignalProducer(value: $0) }}()
    private let favProposal = MutableProperty<[FavProposal]>([])
    
    init() {
        super.init(frame: .zero)
        addSubview(collectionView)
        autoLayout()
    }
    
    func bind(_ inOut: MyFavProposalCollectionViewInOut) {
        favProposal <~ inOut.favProposal.producer.take(during: reactive.lifetime)
        selectProposalAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues{ (value) in
            inOut.selectProposalAction.apply(value).start()
        }
    }
    
    private func autoLayout() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyFavProposalCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favProposal.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFavProposalCollectionCell.description(), for: indexPath) as! MyFavProposalCollectionCell
        cell.setFavProposal(favProposal.value[indexPath.item])
        cell.selectProposalAction = selectProposalAction
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
