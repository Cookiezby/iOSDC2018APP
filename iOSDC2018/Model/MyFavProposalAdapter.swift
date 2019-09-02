//
//  MyFavProposal.swift
//  iOSDC2018
//
//  Created by 朱　冰一 on 2018/08/15.
//  Copyright © 2018年 zhubingyi. All rights reserved.
//

import Foundation

final class FavProposal {
    var date: Date
    var proposals: [Proposal]
    
    init(date: Date) {
        self.date = date
        self.proposals = []
    }
    
    @discardableResult
    func insertProposal(_ proposal: Proposal) -> Bool {
        for p in proposals {
            if p.overlay(proposal: proposal) {
                return false
            }
        }
        proposals.append(proposal)
        // amount is small so, just sort the array
        proposals = proposals.sorted { (l, r) -> Bool in
            return l.timetable.startsAt < r.timetable.startsAt
        }
        return true
    }
}

final class MyFavProposalManager {
    
    static var shared: MyFavProposalManager {
        switch iOSDCJapan.current {
        case .year18: return shared18
        case .year19: return shared19
        }
    }
    
    private static let shared18 = MyFavProposalManager(key: "MY_FAV_PROPOSAL")
    private static let shared19 = MyFavProposalManager(key: "MY_FAV_PROPOSAL19")
    
    private let key: String
    private(set) var favIds: [String] = []
    
    var proposals: [Proposal] = []
        
    var favProposals: [Proposal] {
        get {
            return proposals.filter{ favIds.contains($0.id) }
        }
    }
    
    init(key: String) {
        self.key = key
        self.favIds = getFavId()
    }
    
    func add(id: String) {
        guard favIds.contains(id) == false else { return }
        favIds.append(id)
        updateFavId(ids: favIds)
    }
    
    func remove(id: String) {
        favIds = favIds.filter{ return $0 != id }
        updateFavId(ids: favIds)
    }
    
    func contains(id: String) -> Bool {
        return favIds.contains(id)
    }
    
    private func updateFavId(ids: [String]) {
        let ud = UserDefaults.standard
        ud.set(favIds, forKey: key)
    }
    

    private func getFavId() -> [String] {
        let ud = UserDefaults.standard
        if let favIds = ud.value(forKey: key) as? [String] {
            return favIds
        } else {
            return []
        }
    }
    
    func overlayCurrentFavProposals(_ proposal: Proposal) -> [Proposal] {
        var overlapProposals = [Proposal]()
        for p in favProposals {
            if p.overlay(proposal: proposal) {
                overlapProposals.append(p)
            }
        }
        return overlapProposals
    }
}


final class MyFavProposalAdapter {
    private(set) var favProposalList: [FavProposal] = []
    private(set) var proposals: [Proposal]
    
    convenience init(proposals: [Proposal]) {
        switch iOSDCJapan.current {
        case .year18:
            self.init(proposals: proposals, days: iOSDCJapanDays.year18)
        case .year19:
           self.init(proposals: proposals, days: iOSDCJapanDays.year19)
        }
    }

    init(proposals: [Proposal], days: [Date]) {
        self.proposals = proposals
        self.favProposalList = []
        for day in days {
            self.favProposalList.append(FavProposal(date: day))
        }
        
        let favProposals = proposals.filter{ return MyFavProposalManager.shared.contains(id: $0.id) }
        for proposal in favProposals {
            for favDayProposal in favProposalList {
                let startTime = proposal.timetable.startsAt
                let dayTime = favDayProposal.date.timeIntervalSince1970
                
                if startTime >= dayTime && startTime < dayTime + 3600 * 24 {
                    favDayProposal.insertProposal(proposal)
                }
            }
        }
    }
}

