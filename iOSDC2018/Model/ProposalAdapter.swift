//
//  ProposalAdapter.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/14.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation

struct iOSDCJapanDays {
    static let year18 = [Date.createBy(year: 2018, month: 8, day: 30),
                         Date.createBy(year: 2018, month: 8, day: 31),
                         Date.createBy(year: 2018, month: 9, day: 1),
                         Date.createBy(year: 2018, month: 9, day: 2)]
    
    static let year19 = [Date.createBy(year: 2019, month: 9, day: 5),
                         Date.createBy(year: 2019, month: 9, day: 6),
                         Date.createBy(year: 2019, month: 9, day: 7)]
}

struct TrackProposal {
    var track: Track
    var proposals: [Proposal]
}

class DayProposal {
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
    
    func insertProposal(_ proposal: Proposal) {
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
    var dayProposalList: [DayProposal]
    
    convenience init(proposals: [Proposal]) {
        switch iOSDCJapanYear.current {
        case .year18:
            self.init(proposals: proposals, days: iOSDCJapanDays.year18)
        case .year19:
            self.init(proposals: proposals, days: iOSDCJapanDays.year19)
        }
    }
    
    init(proposals: [Proposal], days: [Date]) {
        self.dayProposalList = []
        for day in days {
            let dayProposal = DayProposal(date: day)
            self.dayProposalList.append(dayProposal)
        }
        
        for proposal in proposals {
            for dayProposal in dayProposalList {
                let startTime = proposal.timetable.startsAt
                let dayTime = dayProposal.date.timeIntervalSince1970
                
                if startTime >= dayTime && startTime < dayTime + 3600 * 24 {
                    dayProposal.insertProposal(proposal)
                }
            }
        }
    }
}


