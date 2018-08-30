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
import UIKit

final class ProposalDetailModel {
    let proposal: Proposal
    init(proposal: Proposal) {
        self.proposal = proposal
    }
}

final class ProposalDetailViewModel: NSObject, ProposalOverlapViewInOut {
    private let model: ProposalDetailModel
    let addFavAction     : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()
    let removeFavAction  : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()
    let presentVCAction  : Action<(UIViewController, Bool), (UIViewController, Bool), NoError> = { Action { SignalProducer(value: $0)} }()
    

    let overlapProposals: MutableProperty<[Proposal]>
    
    lazy var twitterButtonAction : Action<Void, URL?, NoError> = { [weak self] in
        Action { _ in
            if let twitter = self?.model.proposal.speaker.twitter {
                return SignalProducer(value: URL(string: "https://twitter.com/" + twitter))
            } else {
                return SignalProducer(value: URL(string: "https://iosdc.jp/2018/"))
            }
        }
    }()
    
    let isOverlap: MutableProperty<Bool>
    let isFavd: MutableProperty<Bool>
    let addButtonHidden = MutableProperty<Bool>(true)
    let removeButtonHidden = MutableProperty<Bool>(true)
    
    init(proposal: Proposal) {
        model = ProposalDetailModel(proposal: proposal)
        isFavd = MutableProperty<Bool>(MyFavProposalManager.shared.contains(id: proposal.id))
    
        overlapProposals = MutableProperty<[Proposal]>(MyFavProposalManager.shared.overlayCurrentFavProposals(proposal))
        isOverlap = MutableProperty<Bool>(overlapProposals.value.count > 0)
        super.init()
        addButtonHidden <~ isFavd.producer.take(during: reactive.lifetime)
        removeButtonHidden <~ isFavd.producer.map { return !$0 }.take(during: reactive.lifetime)
        
        addFavAction.values.take(during: reactive.lifetime).observeValues { [weak self] _ in
            guard let sSelf = self else { return }
            guard let proposal = self?.model.proposal else { return }
            for op in sSelf.overlapProposals.value {
                MyFavProposalManager.shared.remove(id: op.id)
            }
            MyFavProposalManager.shared.add(id: proposal.id)
            self?.overlapProposals.swap([])
            self?.isOverlap.swap(false)
            self?.isFavd.swap(true)
        }
        
        removeFavAction.values.take(during: reactive.lifetime).observeValues { [weak self] _ in
            guard let id = self?.model.proposal.id else { return }
            MyFavProposalManager.shared.remove(id: id)
            self?.isFavd.swap(false)
        }
    }
    
}
