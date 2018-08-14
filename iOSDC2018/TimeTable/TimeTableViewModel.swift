//
//  TimelineTableViewModel.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

final class TimeTableViewModel: NSObject, TimeTableNaviBarInOut, DayTrackCollectionViewCellInOut {
    let openInfoAction: Action<Void, Void, NoError> = { Action { SignalProducer(value: $0) }}()
    let presentVCAction: Action<(UIViewController, Bool), (UIViewController, Bool), NoError>  = { Action { SignalProducer(value: $0) }}()
    let selectTrackAction: Action<Proposal, Proposal, NoError> = { Action { SignalProducer(value: $0) }}()
    
    override init() {
        super.init()
        openInfoAction.values.take(during: reactive.lifetime).observeValues { [weak self] _ in
            let vc = UINavigationController(rootViewController: InfoViewController())
            self?.presentVCAction.apply((vc, true)).start()
        }
        
        selectTrackAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (value) in
            let vc = TrackDetailViewController(proposal: value)
            vc.modalPresentationStyle = .overCurrentContext
            self?.presentVCAction.apply((vc, false)).start()
        }
    }
}
