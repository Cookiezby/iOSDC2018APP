//
//  NofiticationInfoViewController.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/19.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

let UDNotificationEnableKey = "UDNotificationEnableKey"

final class NotificationInfoViewController: UIViewController {
    private let notiCellLabel: UILabel = {
        let label = UILabel()
        label.text = "通知を受け取る"
        label.textColor = UIColor.mainTextColor
        label.font = UIFont.pingFang(size: 15)
        return label
    }()
    
    private let notiCellBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var notiCellSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = AppDelegate.notificaitonEnable()
        return switcher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "通知設定"
        view.backgroundColor = UIColor.hex("FAFAFA")
        view.addSubview(notiCellBackView)
        notiCellBackView.addSubview(notiCellLabel)
        notiCellBackView.addSubview(notiCellSwitch)
        autoLayout()
        
        notiCellSwitch.reactive.isOnValues.signal.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (value) in
            self?.updateNotificationEnable(value)
        }
    }
    
    private func autoLayout() {
        notiCellBackView.snp.makeConstraints { (make) in
            make.top.equalTo(navigationController!.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height + 8)
            make.left.right.equalToSuperview()
            make.height.equalTo(46)
        }
        
        notiCellLabel.sizeToFit()
        notiCellLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        notiCellSwitch.sizeToFit()
        notiCellSwitch.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
            make.width.equalTo(notiCellSwitch.bounds.width)
            make.height.equalTo(notiCellSwitch.bounds.height)
        }
    }
    
    private func updateNotificationEnable(_ enable: Bool) {
        if enable {
            UIApplication.shared.registerForRemoteNotifications()
        } else {
            UIApplication.shared.unregisterForRemoteNotifications()
        }
        let ud = UserDefaults.standard
        ud.setValue(enable, forKey: UDNotificationEnableKey)
        ud.synchronize()
    }
}
