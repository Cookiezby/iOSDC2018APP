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
class ProposalDetailModel {
    let proposal: Proposal
    init(proposal: Proposal) {
        self.proposal = proposal
    }
}

final
class ProposalDetailViewModel: NSObject {
    private let model: ProposalDetailModel
    let addFavAction        : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()
    let removeFavAction     : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()

    lazy var twitterButtonAction : Action<Void, URL?, NoError> = {
        Action { _ in
            SignalProducer(value: URL(string: "https://twitter.com/" + self.model.proposal.speaker.twitter))
        }
    }()
    
    let isFavd: MutableProperty<Bool>
    
    let addButtonHidden = MutableProperty<Bool>(true)
    let removeButtonHidden = MutableProperty<Bool>(true)
    
    init(proposal: Proposal) {
        model = ProposalDetailModel(proposal: proposal)
        isFavd = MutableProperty<Bool>(MyFavProposalManager.shared.contains(id: proposal.id))
        super.init()
        addButtonHidden <~ isFavd.producer.take(during: reactive.lifetime)
        removeButtonHidden <~ isFavd.producer.map { return !$0 }.take(during: reactive.lifetime)
        
        addFavAction.values.take(during: reactive.lifetime).observeValues { [weak self] _ in
            guard let proposal = self?.model.proposal else { return }
            guard MyFavProposalManager.shared.overlayCurrentFavProposals(proposal) == false else {
                return
            }
            MyFavProposalManager.shared.add(id: proposal.id)
            self?.isFavd.swap(true)
        }
        
        removeFavAction.values.take(during: reactive.lifetime).observeValues { [weak self] _ in
            guard let id = self?.model.proposal.id else { return }
            MyFavProposalManager.shared.remove(id: id)
            self?.isFavd.swap(false)
        }
    }
    
}
