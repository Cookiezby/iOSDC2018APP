//
//  TimelineTablViewController.swift
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
import SnapKit
import MBProgressHUD

protocol TimeTableNaviBarInOut {
    var openInfoAction: Action<Void, Void, NoError> { get }
    var toggleYearListAction: Action<Void, Void, NoError> { get }
    var logoImage: MutableProperty<UIImage?> { get }
}

fileprivate final
class TimeTableNaivBar: UIView {
    private let logoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "iOSDCLogo")
        return view
    }()
    
    private let switchYearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "NavMenu"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
        return button
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "InfoButton"), for: .normal)
        return button
    }()

    private let naviBarLayoutGuide = UILayoutGuide()
   
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(logoImageView)
        addSubview(infoButton)
        addSubview(switchYearButton)
        addLayoutGuide(naviBarLayoutGuide)
        autoLayout()
    }
    
    func bind(_ inOut: TimeTableNaviBarInOut) {
        infoButton.reactive.pressed = CocoaAction(inOut.openInfoAction)
        switchYearButton.reactive.pressed = CocoaAction(inOut.toggleYearListAction)
        
        inOut.logoImage.producer.take(during: reactive.lifetime).observe(on: UIScheduler()).startWithValues { [weak self] (image) in
            guard let self = self else { return }
            self.logoImageView.image = image
        }
    }
    
    private func autoLayout() {
        naviBarLayoutGuide.snp.makeConstraints { (make) in
            make.top.equalTo(UIApplication.shared.statusBarFrame.height)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        switchYearButton.snp.makeConstraints { (make) in
            make.left.equalTo(2)
            make.height.equalTo(19)
            make.width.equalTo(39)
            make.centerY.equalTo(naviBarLayoutGuide)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.center.equalTo(naviBarLayoutGuide)
            make.width.equalTo(100)
            make.height.equalTo(28)
        }
        
        infoButton.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.size.equalTo(19)
            make.centerY.equalTo(naviBarLayoutGuide)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol TimeTableViewControllerDelegate: class {
    func reloadFav()
}

final
class TimeTableViewController: UIViewController {
    private let naviBar: TimeTableNaivBar = {
        let view = TimeTableNaivBar()
        view.layer.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 1, blur: 10, spread: 0)
        return view
    }()
    
    private let trackSelectView = TrackSelectView()
    private let dayTrackCollecitonView = DayTrackCollectionView()
    private let myFavProposalView = MyFavProposalCollectionView()
    private let yearListView = YearListView()
    
    private let viewModel = TimeTableViewModel()
    private var hud: MBProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.addSubview(trackSelectView)
        view.addSubview(dayTrackCollecitonView)
        view.addSubview(myFavProposalView)
        view.addSubview(yearListView)
        view.addSubview(naviBar)
        autoLayout()
        bind(viewModel)
        viewModel.fetchAllProposal()
    }
    
    func bind(_ viewModel: TimeTableViewModel) {
        naviBar.bind(viewModel)
        dayTrackCollecitonView.bind(viewModel)
        trackSelectView.bind(viewModel)
        myFavProposalView.bind(viewModel)
        yearListView.bind(inOut: viewModel)
        
        myFavProposalView.reactive.isHidden <~ viewModel.myFavHidden.producer.take(during: reactive.lifetime)
        
        viewModel.presentVCAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (vc, animated) in
            if let vc  = vc as? ProposalDetailViewController {
                vc.delegate = self
            }
            self?.present(vc, animated: animated, completion: nil)
        }
        
        viewModel.hudHidden.signal.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (hidden) in
            guard let view = self?.view else { return }
            if hidden {
                self?.hud?.hide(animated: true)
            } else {
                self?.hud = MBProgressHUD.showAdded(to: view, animated: true)
            }
        }
        
        viewModel.errorMessageAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (message) in
            guard let view = self?.view else { return }
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.label.text = message
            hud.mode = .text
            hud.hide(animated: true, afterDelay: 1.0)
        }
        
        viewModel.yearListViewHidden.producer.take(during: reactive.lifetime).startWithValues { [weak self] (value) in
            guard let self = self else { return }
            self.toggleYearListView(hidden: value)
        }
        
        viewModel.toggleYearListAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] _ in
            guard let self = self else { return }
            let hidden = !self.yearListView.isHidden
            self.toggleYearListView(hidden: hidden)
        }
    }
    
    private func autoLayout() {
        naviBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(navigationController!.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height)
        }
        
        trackSelectView.snp.makeConstraints { (make) in
            make.top.equalTo(naviBar.snp.bottom)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(45)
        }
        
        dayTrackCollecitonView.snp.makeConstraints { (make) in
            make.top.equalTo(trackSelectView)
            make.left.equalTo(trackSelectView.snp.right)
            make.right.bottom.equalToSuperview()
        }
        
        myFavProposalView.snp.makeConstraints { (make) in
            make.edges.equalTo(dayTrackCollecitonView)
        }
        
        yearListView.snp.makeConstraints { (make) in
            make.left.equalTo(3)
            make.right.equalTo(-3)
            make.top.equalTo(self.naviBar.snp.bottom).offset(3)
            make.height.equalTo(85)
        }
    }
    
    private func toggleYearListView(hidden: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            if hidden {
                self.yearListView.alpha = 0.0
                self.yearListView.snp.updateConstraints{ (make) in
                    make.top.equalTo(self.naviBar.snp.bottom).offset(-20)
                }
            } else {
                self.yearListView.isHidden = false
                self.yearListView.alpha = 1.0
                self.yearListView.snp.updateConstraints{ (make) in
                    make.top.equalTo(self.naviBar.snp.bottom).offset(3)
                }
            }
            self.view.layoutIfNeeded()
        }, completion: { _ in
            if hidden {
                self.yearListView.isHidden = true
                self.yearListView.alpha = 0.0
            }
        })
    }
}

extension TimeTableViewController: TimeTableViewControllerDelegate{
    func reloadFav() {
        viewModel.refresh()
    }
}
