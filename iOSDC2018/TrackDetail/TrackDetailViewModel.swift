//
//  TrackDetailViewModel.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/12.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import Result

final
class TrackDetailModel {
    let proposal: Proposal
    init(proposal: Proposal) {
        self.proposal = proposal
    }
}

final
class TrackDetailViewModel: NSObject {
    private let model: TrackDetailModel
    
    let addFavAction        : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()
    let removeFavAction     : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()
    lazy var twitterButtonAction : Action<Void, URL?, NoError> = {
        Action { _ in
            SignalProducer(value: URL(string: self.model.proposal.twitterLink))
        }
    }()
    
    let isFavd: MutableProperty<Bool>
    
    let addButtonHidden = MutableProperty<Bool>(true)
    let removeButtonHidden = MutableProperty<Bool>(true)
    
    init(proposal: Proposal) {
        model = TrackDetailModel(proposal: proposal)
        isFavd = MutableProperty<Bool>(MyFavProposal.shared.contains(id: proposal.id))
        super.init()
        addButtonHidden <~ isFavd.producer.take(during: reactive.lifetime)
        removeButtonHidden <~ isFavd.producer.map { return !$0 }.take(during: reactive.lifetime)
        
        addFavAction.values.take(during: reactive.lifetime).observeValues { [weak self] _ in
            guard let id = self?.model.proposal.id else { return }
            MyFavProposal.shared.add(id: id)
            self?.isFavd.swap(true)
        }
        
        removeFavAction.values.take(during: reactive.lifetime).observeValues { [weak self] _ in
            guard let id = self?.model.proposal.id else { return }
            MyFavProposal.shared.remove(id: id)
            self?.isFavd.swap(false)
        }
    }
    
}
