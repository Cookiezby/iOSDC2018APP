//
//  ProposalAdapter.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/14.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation

struct TrackProposal {
    var track: Track
    var dayProposals: [DayProposal]
    
    init(track: Track) {
        self.track = track
        self.dayProposals =  [DayProposal(date: Date.createBy(year: 2018, month: 8, day: 30), proposals: []),
                              DayProposal(date: Date.createBy(year: 2018, month: 8, day: 31), proposals: []),
                              DayProposal(date: Date.createBy(year: 2018, month: 9, day: 1), proposals: []),
                              DayProposal(date: Date.createBy(year: 2018, month: 9, day: 2), proposals: [])]
    }
    
    mutating func insertProposal(_ proposal: Proposal) {
        for i in 0 ..< dayProposals.count {
            let startTime = dayProposals[i].date.timeIntervalSince1970
            if startTime ..< startTime + 3600 * 24 ~= Double(proposal.startTime) {
                dayProposals[i].proposals.append(proposal)
            }
        }
    }
}

struct DayProposal {
    var date: Date
    var proposals: [Proposal]
}


struct NewDayProposal {
    var date: Date
    var trackProposals: [NewTrackProposal]
    
    init(date: Date) {
        self.date = date
        self.trackProposals = [NewTrackProposal(track: Track.A, proposals: []),
                               NewTrackProposal(track: Track.B, proposals: []),
                               NewTrackProposal(track: Track.C, proposals: []),
                               NewTrackProposal(track: Track.D, proposals: [])]
    }
    
    mutating func insertProposal(_ proposal: Proposal) {
        switch proposal.track {
        case .A:
            trackProposals[0].proposals.append(proposal)
        case .B:
            trackProposals[1].proposals.append(proposal)
        case .C:
            trackProposals[2].proposals.append(proposal)
        case .D:
            trackProposals[3].proposals.append(proposal)
        }
    }
}

struct NewTrackProposal {
    var track: Track
    var proposals: [Proposal]
}

final class ProposalAdapter {
    static let shared = ProposalAdapter()
    var trackProposalList = [TrackProposal]()
    
    var dayProposalList = [NewDayProposal]()

    init() {
        let sorted = Proposal.all.sorted { (l, r) -> Bool in
            return l.startTime < r.startTime
        }
        
//        var trackA = TrackProposal(track: Track.A)
//        var trackB = TrackProposal(track: Track.B)
//        var trackC = TrackProposal(track: Track.C)
//        var trackD = TrackProposal(track: Track.D)
//
//        sorted.forEach {
//            switch $0.track {
//            case .A:
//                trackA.insetProposal($0)
//            case .B:
//                trackB.insetProposal($0)
//            case .C:
//                trackC.insetProposal($0)
//            case .D:
//                trackD.insetProposal($0)
//            }
//        }
//        trackProposalList = [trackA, trackB, trackC, trackD]
        
        var day1 = NewDayProposal(date: Date.createBy(year: 2018, month: 8, day: 30))
        var day2 = NewDayProposal(date: Date.createBy(year: 2018, month: 8, day: 31))
        var day3 = NewDayProposal(date: Date.createBy(year: 2018, month: 9, day: 1))
        var day4 = NewDayProposal(date: Date.createBy(year: 2018, month: 9, day: 2))
        
        sorted.forEach {
            switch Double($0.startTime) {
            case day1.date.timeIntervalSince1970 ..< day1.date.timeIntervalSince1970 + 3600 * 24:
                day1.insertProposal($0)
            case day2.date.timeIntervalSince1970 ..< day2.date.timeIntervalSince1970 + 3600 * 24:
                day2.insertProposal($0)
            case day3.date.timeIntervalSince1970 ..< day3.date.timeIntervalSince1970 + 3600 * 24:
                day3.insertProposal($0)
            case day4.date.timeIntervalSince1970 ..< day4.date.timeIntervalSince1970 + 3600 * 24:
                day4.insertProposal($0)
            default:
                break
            }
        }
        dayProposalList = [day1, day2, day3, day4]
    }
    
   
}


