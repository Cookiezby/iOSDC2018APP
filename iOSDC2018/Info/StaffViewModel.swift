//
//  StaffViewModel.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/21.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit

struct Staff {
    var name: String
    var URL: String
    var avatarURL: String
    
    init?(dict: [String: Any]) {
        if let name = dict["name"] as? String,
            let url = dict["url"] as? String,
            let avatarURL = dict["avatar_url"] as? String
        {
            self.name = name
            self.URL = url
            self.avatarURL = avatarURL
        } else {
            return nil
        }
    }
}

struct StaffSection {
    var sectionHeader: String
    var staffs: [Staff]
}


final class StaffModel: NSObject {
    let sections = MutableProperty<[StaffSection]>([])
    
    func fetchStaff(succeed: (() -> Void)?, failed: ((Error?) -> Void)?) {
        guard let url = URL(string: iOSDCJapan.staffApi) else { return }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
        let task = session.dataTask(with: request) { [weak self ] (data, response, error) in
            guard let sSelf = self else { return }
            guard let data = data else { return }
            guard error == nil else {
                failed?(error!)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
            guard let dict = json as? [String: Any] else { return }
            guard let allStaff = dict["staff"] as? [String: Any] else { return }
            var result = [StaffSection]()
            if let coreStaffs = allStaff["実行委員長"] as? [[String: Any]],
                let seciotn = sSelf.genSection(header: "実行委員長", dicts: coreStaffs) {
                result.append(seciotn)
            }
            if let coreStaffs = allStaff["コアスタッフ"] as? [[String: Any]],
                let seciotn = sSelf.genSection(header: "コアスタッフ", dicts: coreStaffs) {
                result.append(seciotn)
            }
            
            if let coreStaffs = allStaff["ネットワークスタッフ"] as? [[String: Any]],
                let seciotn = sSelf.genSection(header: "ネットワークスタッフ", dicts: coreStaffs) {
                result.append(seciotn)
            }
            
            if let coreStaffs = allStaff["当日スタッフ"] as? [[String: Any]],
                let seciotn = sSelf.genSection(header: "当日スタッフ", dicts: coreStaffs) {
                result.append(seciotn)
            }
            sSelf.sections.swap(result)
            succeed?()
        }
        task.resume()
    }
    
    private func genSection(header: String, dicts: [[String: Any]]) -> StaffSection? {
        var section = StaffSection(sectionHeader: header, staffs: [])
        section.staffs.append(contentsOf: dicts.compactMap{ (dict) -> Staff? in
            return Staff(dict: dict)
        })
        guard section.staffs.count > 0 else { return nil }
        return section
    }
}

final class StaffViewModel: NSObject {
    private let model = StaffModel()
    var sections = MutableProperty<[StaffSection]>([])
    
    let pushVCAction: Action<(UIViewController, Bool), (UIViewController, Bool), NoError> = { Action { SignalProducer(value: $0)} }()
    let selectStaffAtIndexPathAction: Action<IndexPath, IndexPath, NoError> = { Action { SignalProducer(value: $0) }}()
    let hudHidden = MutableProperty<Bool>(true)
    let errorMessageAction: Action<String, String, NoError> = { Action { SignalProducer(value: $0) }}()
    
    override init() {
        super.init()
        sections <~ model.sections.signal.take(during: reactive.lifetime).observe(on: UIScheduler())
        selectStaffAtIndexPathAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (indexPath) in
            if let urlStr = self?.sections.value[indexPath.section].staffs[indexPath.row].URL, let url = URL(string: urlStr) {
                let vc = WebInfoViewController(url: url)
                self?.pushVCAction.apply((vc, true)).start()
            }
        }
    }
    
    func fetchStaff() {
        hudHidden.swap(false)
        model.fetchStaff(succeed: {
            self.hudHidden.swap(true)
        }) { (error) in
            self.hudHidden.swap(true)
            self.errorMessageAction.apply("通信エラー").start()
        }
    }
}




