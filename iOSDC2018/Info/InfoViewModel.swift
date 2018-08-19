//
//  InfoViewModel.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/19.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result
import UIKit
import SafariServices

struct Info {
    var iconImage: UIImage?
    var title: String
    var action: Action<Void, Void, NoError>
}

final class InfoViewModel: NSObject {
    var infoList: [Info]
    let openHomePageAciton      : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()
    let openAccessAction        : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()
    let openNotificationAction  : Action<Void, Void, NoError> = { Action { SignalProducer(value: $0)} }()
   
    let pushVCAction: Action<(UIViewController, Bool), (UIViewController, Bool), NoError> = { Action { SignalProducer(value: $0)} }()
    
    override init() {
        infoList = []
        super.init()
        
        let homePageInfo = Info(iconImage: UIImage(named: "HomeIcon"), title: "公式サイト", action: openHomePageAciton)
        let accessInfo = Info(iconImage: UIImage(named: "AccessIcon"), title: "会場アクセス", action: openAccessAction)
        let notificaitonInfo = Info(iconImage: UIImage(named: "NotificationIcon"), title: "通知設定", action: openNotificationAction)
        
        let openHomePageSignal: Signal<(UIViewController, Bool), NoError> = openHomePageAciton.values.map {
            let vc = WebInfoViewController(url: URL(string: "https://iosdc.jp/2018/")!)
            return (vc, true)
        }
        
        let accessSignal: Signal<(UIViewController, Bool), NoError> = openAccessAction.values.map {
            let vc = WebInfoViewController(url: URL(string: "https://iosdc.jp/2018/access")!)
            return (vc, true)
        }
        
        let notificationSignal: Signal<(UIViewController, Bool), NoError> = openNotificationAction.values.map {
            let vc = NotificationInfoViewController()
            return (vc, true)
        }
        
        
        Signal.merge(openHomePageSignal,
                     accessSignal,
                     notificationSignal).take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] value in
            self?.pushVCAction.apply(value).start()
        }
        
        infoList = [homePageInfo, accessInfo, notificaitonInfo]
    }
    
}
