//
//  iOSDCYear.swift
//  iOSDC2018
//
//  Created by 朱冰一 on 2019/09/02.
//  Copyright © 2019 zhubingyi. All rights reserved.
//

import Foundation

enum iOSDCJapan {
    static var current: iOSDCJapan = .year19
    case year18
    case year19
    
    static var homeUrl: String {
        switch iOSDCJapan.current {
        case .year19:
            return "https://iosdc.jp/2019/"
        case .year18:
            return "https://iosdc.jp/2018/"
        }
    }
    
    static var accessUrl: String {
        switch iOSDCJapan.current {
        case .year19:
            return "https://iosdc.jp/2019/access.html"
        case .year18:
            return "https://iosdc.jp/2018/access.html"
        }
    }
    
    static var staffApi: String {
        switch iOSDCJapan.current {
        case .year19:
            return "https://fortee.jp/iosdc-japan-2019/api/staff"
        case .year18:
            return "https://fortee.jp/iosdc-japan-2018/api/staff"
        }
    }
}
