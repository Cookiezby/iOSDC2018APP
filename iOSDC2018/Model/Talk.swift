//
//  Talk.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation

struct Track {
    var name: String
}

struct People {
    var name: String
    var profileImageURL: String
    var twitterLink: String
}

protocol Session {
    var title: String { get }
    var startDate: Int { get }
    var duration: Int { get }
}

struct Talk: Session {
    var people: People
    var startDate: Int
    var duration: Int
    var title: String
    var detail: String
}

struct Event: Session {
    var title: String
    var startDate: Int
    var duration: Int
}
