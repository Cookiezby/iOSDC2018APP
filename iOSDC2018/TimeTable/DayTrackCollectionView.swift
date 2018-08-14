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
    var selectTrackAction: Action<Proposal, Proposal, NoError> { get }
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
    
    var selectTrackAction: Action<Proposal, Proposal, NoError> = { Action { SignalProducer(value: $0) }}()
    
    init() {
        super.init(frame: .zero)
        addSubview(collectionView)
    }
    
    func bind(_ inOut: DayTrackCollectionViewCellInOut) {
        selectTrackAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues{ (value) in
            inOut.selectTrackAction.apply(value).start()
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayTrackCollectionViewCell.description(), for: indexPath) as! DayTrackCollectionViewCell
        cell.selectTrackAction = selectTrackAction
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}


