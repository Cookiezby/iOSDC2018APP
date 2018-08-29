//
//  DayTrackCollectionView.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result

protocol DayTrackCollectionViewCellInOut {
    var selectProposalAction: Action<Proposal, Proposal, NoError> { get }
    var dayProposalList: MutableProperty<[DayProposal]> { get }
    var curDayProposal: MutableProperty<DayProposal?> { get }
    var reloadDayTrackAction: Action<Void, Void, NoError> { get }
    var refreshCollectionView: Action<Void, Void, NoError> { get }
}

final class DayTrackCollectionView: UIView {
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
        view.register(DayTrackCollectionViewCell.self, forCellWithReuseIdentifier: DayTrackCollectionViewCell.description())
        return view
    }()
    
    var selectProposalAction: Action<Proposal, Proposal, NoError> = { Action { SignalProducer(value: $0) }}()
    private let curDayProposal  = MutableProperty<DayProposal?>(nil)
    private var isScrolling: Bool = false
    
    init() {
        super.init(frame: .zero)
        addSubview(collectionView)
    }
    
    func bind(_ inOut: DayTrackCollectionViewCellInOut) {
        selectProposalAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues{ (value) in
            inOut.selectProposalAction.apply(value).start()
        }
        
        inOut.curDayProposal.signal.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (value) in
            self?.curDayProposal.value = value
            self?.collectionView.reloadData()
            self?.collectionView.contentOffset = .zero
        }
        
        inOut.reloadDayTrackAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (value) in
            guard let isScrolling = self?.isScrolling else { return }
            guard isScrolling == false else { return }
            self?.collectionView.reloadData()
        }
        
        inOut.refreshCollectionView.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (value) in
            self?.collectionView.reloadData()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DayTrackCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return curDayProposal.value?.trackProposals.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayTrackCollectionViewCell.description(), for: indexPath) as! DayTrackCollectionViewCell
        cell.selectProposalAction = selectProposalAction
        if let trackProposal = curDayProposal.value?.trackProposals[indexPath.item] {
            cell.setTrackProposal(trackProposal)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return CGSize(width: collectionView.bounds.width / 4, height: collectionView.bounds.height)
        } else {
            return collectionView.bounds.size
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isScrolling = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isScrolling = false
    }
}


