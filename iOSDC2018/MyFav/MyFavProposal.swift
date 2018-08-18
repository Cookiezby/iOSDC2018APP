//
//  MyFavProposal.swift
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
            return true
            //return l.startTime < r.startTime
        }
        return true
    }
}

fileprivate let MyFavProposalKey = "MY_FAV_PROPOSAL"

final class MyFavProposal {
    static let shared = MyFavProposal()
    private(set) var favIds: [String] = []
    private(set) var favProposalList: [FavProposal] = []
    
    init() {
        favIds = getFavId()
        updateFavProposals()
    }
    
    func overlayCurrentFavProposals(_ proposal: Proposal) -> Bool {
//        let favProposals = Proposal.all.filter{ return favIds.contains($0.id) }
//        for p in favProposals {
//            if p.overlay(proposal: proposal) {
//                return true
//            }
//        }
        return false
    }
    
    func add(id: String) {
        guard favIds.contains(id) == false else { return }
        favIds.append(id)
        updateFavId(ids: favIds)
        updateFavProposals()
    }
    
    func remove(id: String) {
        favIds = favIds.filter{ return $0 != id }
        updateFavId(ids: favIds)
        updateFavProposals()
    }
    
    func contains(id: String) -> Bool {
        return favIds.contains(id)
    }
    
    private func updateFavId(ids: [String]) {
        let ud = UserDefaults.standard
        ud.set(favIds, forKey: MyFavProposalKey)
    }
    
    private func getFavId() -> [String] {
        let ud = UserDefaults.standard
        if let favIds = ud.value(forKey: MyFavProposalKey) as? [String] {
            return favIds
        } else {
            return []
        }
    }
    
    func updateFavProposals() {
//        var day1 = FavProposal(date: Date.createBy(year: 2018, month: 8, day: 30), proposals: [])
//        var day2 = FavProposal(date: Date.createBy(year: 2018, month: 8, day: 31), proposals: [])
//        var day3 = FavProposal(date: Date.createBy(year: 2018, month: 9, day: 1), proposals: [])
//        var day4 = FavProposal(date: Date.createBy(year: 2018, month: 9, day: 2), proposals: [])
//
//        let favProposals = Proposal.all.filter{ return favIds.contains($0.id) }
//
//        favProposals.forEach {
//            switch Double($0.startTime) {
//            case day1.date.timeIntervalSince1970 ..< day1.date.timeIntervalSince1970 + 3600 * 24:
//                day1.insertProposal($0)
//            case day2.date.timeIntervalSince1970 ..< day2.date.timeIntervalSince1970 + 3600 * 24:
//                day2.insertProposal($0)
//            case day3.date.timeIntervalSince1970 ..< day3.date.timeIntervalSince1970 + 3600 * 24:
//                day3.insertProposal($0)
//            case day4.date.timeIntervalSince1970 ..< day4.date.timeIntervalSince1970 + 3600 * 24:
//                day4.insertProposal($0)
//            default:
//                break
//            }
//        }
//        favProposalList = [day1, day2, day3, day4]
    }
}

