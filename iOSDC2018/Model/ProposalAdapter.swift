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
    var proposals: [Proposal]
}

struct DayProposal {
    var date: Date
    var trackProposals: [TrackProposal]
    
    init(date: Date) {
        self.date = date
        self.trackProposals = [TrackProposal(track: Track.A, proposals: []),
                               TrackProposal(track: Track.B, proposals: []),
                               TrackProposal(track: Track.C, proposals: []),
                               TrackProposal(track: Track.D, proposals: []),
                               TrackProposal(track: Track.E, proposals: [])]
    }
    
    mutating func insertProposal(_ proposal: Proposal) {
        switch proposal.timetable.track {
        case .A:
            trackProposals[0].proposals.append(proposal)
        case .B:
            trackProposals[1].proposals.append(proposal)
        case .C:
            trackProposals[2].proposals.append(proposal)
        case .D:
            trackProposals[3].proposals.append(proposal)
        case .E:
            trackProposals[4].proposals.append(proposal)
        }
    }
}

final class ProposalAdapter {
    let dayProposalList: [DayProposal]

    init(allProposals: [Proposal]) {
        let sorted = allProposals.sorted { (l, r) -> Bool in
            return l.timetable.startsAt < r.timetable.startsAt
        }

        var day1 = DayProposal(date: Date.createBy(year: 2018, month: 8, day: 30))
        var day2 = DayProposal(date: Date.createBy(year: 2018, month: 8, day: 31))
        var day3 = DayProposal(date: Date.createBy(year: 2018, month: 9, day: 1))
        var day4 = DayProposal(date: Date.createBy(year: 2018, month: 9, day: 2))
        
        sorted.forEach {
            switch $0.timetable.startsAt {
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


