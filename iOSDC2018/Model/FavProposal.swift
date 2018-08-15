//
//  FavProposal.swift
//  iOSDC2018
//
//  Created by 朱　冰一 on 2018/08/15.
//  Copyright © 2018年 zhubingyi. All rights reserved.
//

import Foundation

struct FavProposal {
    var date: Date
    var proposals: [Proposal]
    
    @discardableResult
    mutating func insertProposal(_ proposal: Proposal) -> Bool {
        for p in proposals {
            if p.overlay(proposal: proposal) {
                return false
            }
        }
        proposals.append(proposal)
        // amount is small so, just sort the array
        proposals = proposals.sorted { (l, r) -> Bool in
            return l.startTime < r.startTime
        }
        return true
    }
}

final
class FavProposalAdapter {
    static let shared = FavProposalAdapter()
    var favProposalList: [FavProposal] = []
    
    init() {
        updateFavProposals()
    }
    
    func updateFavProposals() {
        var day1 = FavProposal(date: Date.createBy(year: 2018, month: 8, day: 30), proposals: [])
        var day2 = FavProposal(date: Date.createBy(year: 2018, month: 8, day: 31), proposals: [])
        var day3 = FavProposal(date: Date.createBy(year: 2018, month: 9, day: 1), proposals: [])
        var day4 = FavProposal(date: Date.createBy(year: 2018, month: 9, day: 2), proposals: [])
        
        let favIds = MyFavProposal.shared.favIds
        let favProposals = Proposal.all.filter{ return favIds.contains($0.id) }
        
        favProposals.forEach {
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
        favProposalList = [day1, day2, day3, day4]
    }
    
    func checkProposalInsertable(_ proposal: Proposal) -> Bool {
        return true
    }
}
