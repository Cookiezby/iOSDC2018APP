//
//  Talk.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation

enum Track: String  {
    case A = "Track A"
    case B = "Track B"
    case C = "Track C"
    case D = "Track D"
}

struct Timetable {
    let track: Track
    let startsAt: Double
    let lengthMin: Int
}

struct Speaker {
    let name: String
    let avatarURL: String
    let twitter: String
}


struct Proposal {
    let id: String
    let title: String
    let abstract: String
    let timetable: Timetable
    let speaker: Speaker
    
    func overlay(proposal: Proposal) -> Bool {
        return false
        //return !((proposal.startTime + proposal.minute) <= startTime || proposal.startTime >= (startTime + minute))
    }
}
