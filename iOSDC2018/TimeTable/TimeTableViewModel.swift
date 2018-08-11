//
//  TimelineTableViewModel.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import Result

final class TimeTableViewModel: NSObject, TimeTableNaviBarInOut {
    let openInfoAction: Action<Void, Void, NoError> = { Action { SignalProducer(value: $0) }}()
    
    override init() {
        super.init()
    }

}
