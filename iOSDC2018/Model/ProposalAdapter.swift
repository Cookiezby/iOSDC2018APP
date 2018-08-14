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
    
    mutating func insetProposal(_ proposal: Proposal) {
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

final class ProposalAdapter {
    static let shared = ProposalAdapter()
    var trackProposalList = [TrackProposal]()

    init() {
        let sorted = Proposal.all.sorted { (l, r) -> Bool in
            return l.startTime < r.startTime
        }
        
        var trackA = TrackProposal(track: Track.A)
        var trackB = TrackProposal(track: Track.B)
        var trackC = TrackProposal(track: Track.C)
        var trackD = TrackProposal(track: Track.D)
        
        sorted.forEach {
            switch $0.track {
            case .A:
                trackA.insetProposal($0)
            case .B:
                trackB.insetProposal($0)
            case .C:
                trackC.insetProposal($0)
            case .D:
                trackD.insetProposal($0)
            }
        }
        trackProposalList = [trackA, trackB, trackC, trackD]
    }
    
   
}


