//
//  MyFavProposal.swift
//  iOSDC2018
//
//  Created by 朱　冰一 on 2018/08/15.
//  Copyright © 2018年 zhubingyi. All rights reserved.
//

import Foundation

fileprivate let MyFavProposalKey = "MY_FAV_PROPOSAL"

final class MyFavProposal {
    static let shared = MyFavProposal()
    private(set) var favIds: [Int] = []
    
    init() {
        favIds = getFavId()
    }
    
    func remove(id: Int) {
        favIds = favIds.filter{ return $0 != id }
        updateFavId(ids: favIds)
    }
    
    func add(id: Int) {
        guard favIds.contains(id) == false else { return }
        favIds.append(id)
        updateFavId(ids: favIds)
    }
    
    func contains(id: Int) -> Bool {
        return favIds.contains(id)
    }
    
    private func updateFavId(ids: [Int]) {
        let ud = UserDefaults.standard
        ud.set(favIds, forKey: MyFavProposalKey)
    }
    
    private func getFavId() -> [Int] {
        let ud = UserDefaults.standard
        if let favIds = ud.value(forKey: MyFavProposalKey) as? [Int] {
            return favIds
        } else {
            return []
        }
    }
}

