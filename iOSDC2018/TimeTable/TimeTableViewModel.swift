//
//  TimelineTableViewModel.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

final class TimeTableModel: NSObject {
    let dayProposalList = MutableProperty<[DayProposal]>([])
    let favProposalList = MutableProperty<[FavProposal]>([])
    
    
    func fetchAllProposal(succeed: (() -> Void)?, failed: ((Error) -> Void)?) {
        guard let url = URL(string: "https://fortee.jp/iosdc-japan-2018/api/proposals/accepted") else { return }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
        let task = session.dataTask(with: request) { [weak self ] (data, response, error) in
            guard let data = data else { return }
            guard error == nil else {
                failed?(error!)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
            guard let dict = json as? [String: Any] else { return }
            guard let allProposals = dict["proposals"] as? [[String: Any]] else { return }
            var result = [Proposal]()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
            for proposal in allProposals {
                if let timetable = proposal["timetable"] as? [String: Any],
                    let speaker = proposal["speaker"] as? [String: Any],
                    let id = proposal["uuid"] as? String,
                    let title = proposal["title"] as? String,
                    let abstract = proposal["abstract"] as? String,
                    let trackStr = timetable["track"] as? String,
                    let startsAtStr = timetable["starts_at"] as? String,
                    let lengthMin = timetable["length_min"] as? Int,
                    let name = speaker["name"] as? String,
                    let avatarURL = speaker["avatar_url"] as? String,
                    let twitter = speaker["twitter"] as? String,
                    let track = Track(rawValue: trackStr),
                    let startsAt = dateFormatter.date(from: startsAtStr)?.timeIntervalSince1970 {
                
                    let s = Speaker(name: name, avatarURL: avatarURL, twitter: twitter)
                    let t = Timetable(track: track, startsAt: startsAt, lengthMin: lengthMin)
                    result.append(Proposal(id: id, title: title, abstract: abstract, timetable: t, speaker: s))
                }
            }
            MyFavProposalManager.shared.proposals = result
            let proposalAdapter = ProposalAdapter(allProposals: result)
            let favProposalAdapter = MyFavProposalAdapter(allProposals: result)
            self?.dayProposalList.swap(proposalAdapter.dayProposalList)
            self?.favProposalList.swap(favProposalAdapter.favProposalList)
            succeed?()
        }
        task.resume()
    }
}

final class TimeTableViewModel: NSObject, TimeTableNaviBarInOut, DayTrackCollectionViewCellInOut, TrackSelectViewInOut, MyFavProposalCollectionViewInOut {
    private let model: TimeTableModel
    
    let openInfoAction: Action<Void, Void, NoError> = { Action { SignalProducer(value: $0) }}()
    let presentVCAction: Action<(UIViewController, Bool), (UIViewController, Bool), NoError>  = { Action { SignalProducer(value: $0) }}()
    let selectProposalAction: Action<Proposal, Proposal, NoError> = { Action { SignalProducer(value: $0) }}()
    
    let dayProposalList = MutableProperty<[DayProposal]>([])
    let favProposalList = MutableProperty<[FavProposal]>([])
    
    let curDayProposal: MutableProperty<DayProposal?>
    let myFavHidden = MutableProperty<Bool>(true)
    let hudHidden = MutableProperty<Bool>(true)
    let errorMessageAction: Action<String, String, NoError> = { Action { SignalProducer(value: $0) }}()
    
    override init() {
        model = TimeTableModel()
        curDayProposal = MutableProperty<DayProposal?>(model.dayProposalList.value.first)
        super.init()
        model.dayProposalList.signal.take(during: reactive.lifetime).observeValues { [weak self] (value) in
            self?.dayProposalList.swap(value)
            self?.curDayProposal.swap(value.first)
        }
        
        favProposalList <~ model.favProposalList.signal.take(during: reactive.lifetime)
        
        openInfoAction.values.take(during: reactive.lifetime).observeValues { [weak self] _ in
            let vc = UINavigationController(rootViewController: InfoViewController())
            self?.presentVCAction.apply((vc, true)).start()
        }
        
        selectProposalAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (value) in
            let vc = ProposalDetailViewController(proposal: value)
            vc.modalPresentationStyle = .overCurrentContext
            self?.presentVCAction.apply((vc, false)).start()
        }
    }
    
    func fetchAllProposal() {
        hudHidden.swap(false)
        model.fetchAllProposal(succeed: {
            self.hudHidden.swap(true)
        }) { (error) in
            self.hudHidden.swap(true)
            self.errorMessageAction.apply("通信エラー").start()
        }
    }
    
    func refresh() {
        favProposalList.swap(MyFavProposalAdapter(allProposals: MyFavProposalManager.shared.favProposals).favProposalList)
    }
}
