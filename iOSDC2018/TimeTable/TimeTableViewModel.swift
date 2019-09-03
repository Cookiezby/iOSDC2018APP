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
import FirebaseFirestore

final class TimeTableModel: NSObject {
    let dayProposalList = MutableProperty<[DayProposal]>([])
    let favProposalList = MutableProperty<[FavProposal]>([])
    
    private let settings: FirestoreSettings = {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        return settings
    }()
    
    func fetchAllProposal(succeed: (() -> Void)?, failed: ((Error) -> Void)?) {
        let db = Firestore.firestore()
        db.settings = self.settings
        db.collection(iOSDCJapan.collectionKey).getDocuments { [weak self] (querySnapshot, err) in
            if let err = err {
                failed?(err)
            } else {
                var result = [Proposal]()
                let dateFormatter = ISO8601DateFormatter()
                for document in querySnapshot!.documents {
                    let proposal = document.data()
                    if let timetable = proposal["timetable"] as? [String: Any],
                        let speaker = proposal["speaker"] as? [String: Any],
                        let id = proposal["uuid"] as? String,
                        let title = proposal["title"] as? String,
                        let abstract = proposal["abstract"] as? String,
                        let trackStr = timetable["track"] as? String,
                        let startsAtStr = timetable["starts_at"] as? String,
                        let lengthMin = timetable["length_min"] as? Int,
                        let name = speaker["name"] as? String,
                        let track = Track(rawValue: trackStr),
                        let startsAt = dateFormatter.date(from: startsAtStr)?.timeIntervalSince1970 {
                        
                        let avatarURL = speaker["avatar_url"] as? String
                        let twitter = speaker["twitter"] as? String
                        
                        let slide = proposal["slide"] as? String

                        let s = Speaker(name: name, avatarURL: avatarURL, twitter: twitter)
                        let t = Timetable(track: track, startsAt: startsAt, lengthMin: lengthMin)
                        result.append(Proposal(id: id, title: title, abstract: abstract, timetable: t, speaker: s, slide: slide))
                    }
                }
                MyFavProposalManager.shared.proposals = result
                let proposalAdapter = ProposalAdapter(proposals: result)
                let favProposalAdapter = MyFavProposalAdapter(proposals: result)
                self?.dayProposalList.swap(proposalAdapter.dayProposalList)
                self?.favProposalList.swap(favProposalAdapter.favProposalList)
                succeed?()
            }
        }
    }
}

final class TimeTableViewModel: NSObject, TimeTableNaviBarInOut, DayTrackCollectionViewCellInOut, TrackSelectViewInOut, MyFavProposalCollectionViewInOut, YearListViewModel {
    private let model: TimeTableModel
    
    let openInfoAction: Action<Void, Void, NoError> = { Action { SignalProducer(value: $0) }}()
    let presentVCAction: Action<(UIViewController, Bool), (UIViewController, Bool), NoError>  = { Action { SignalProducer(value: $0) }}()
    let refreshCollectionView: Action<Void, Void, NoError> = { Action { SignalProducer(value: $0) }}()
    
    let selectProposalAction: Action<Proposal, Proposal, NoError> = { Action { SignalProducer(value: $0) }}()
    let reloadDayTrackAction: Action<Void, Void, NoError> = { Action { SignalProducer(value: $0) }}()
    
    let dayProposalList = MutableProperty<[DayProposal]>([])
    let favProposalList = MutableProperty<[FavProposal]>([])
    
    let curDayProposal: MutableProperty<DayProposal?>
    let myFavHidden = MutableProperty<Bool>(true)
    let hudHidden = MutableProperty<Bool>(true)
    let errorMessageAction: Action<String, String, NoError> = { Action { SignalProducer(value: $0) }}()
    
    let toggleYearListAction: Action<Void, Void, NoError> = { Action { SignalProducer(value: $0) }}()
    let selectYearAction: Action<iOSDCJapan, iOSDCJapan, NoError> = { Action { SignalProducer(value: $0) }}()
    
    let yearListViewHidden = MutableProperty<Bool>(true)
    let logoImage = MutableProperty<UIImage?>(iOSDCJapan.current.logoImage)
    
    var timerDispose: Disposable? = nil
    
    override init() {
        model = TimeTableModel()
        curDayProposal = MutableProperty<DayProposal?>(model.dayProposalList.value.first)
        super.init()
        setupNotificaitonObserver()
        
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
        
        selectYearAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (value) in
            guard iOSDCJapan.current != value else {
                self?.yearListViewHidden.swap(true)
                return
            }
            
            iOSDCJapan.current = value
            self?.logoImage.swap(iOSDCJapan.current.logoImage)
            self?.yearListViewHidden.swap(true)
            self?.fetchAllProposal()
        }
    }
    
    func fetchAllProposal() {
        hudHidden.swap(false)
        model.fetchAllProposal(succeed: {
            self.hudHidden.swap(true)
            self.setupTimer()
        }) { (error) in
            self.hudHidden.swap(true)
            self.errorMessageAction.apply("通信エラー").start()
        }
    }
    
    
    func refresh() {
        favProposalList.swap(MyFavProposalAdapter(proposals: MyFavProposalManager.shared.favProposals).favProposalList)
        refreshCollectionView.apply().start()
    }
    
    func setupNotificaitonObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(applicationWillEnterForground),
                                               name:NSNotification.Name.UIApplicationWillEnterForeground,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(applicationWillResignActive),
                                               name:NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil)
    }
    
    @objc
    func applicationWillEnterForground() {
        reloadDayTrackAction.apply().start()
        refresh()
        setupTimer()
    }
    
    @objc
    func applicationWillResignActive() {
        timerDispose?.dispose()
    }
    
    private func setupTimer() {
        timerDispose?.dispose()
        timerDispose = nil
        timerDispose = SignalProducer.timer(interval: .seconds(120), on: QueueScheduler.main).producer.startWithValues { [weak self] (_) in
            self?.reloadDayTrackAction.apply().start()
            self?.refresh()
        }
    }
}
