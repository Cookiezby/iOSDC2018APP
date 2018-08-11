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

fileprivate final
class TimeTableNaivBar: UIView {
    private let imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "iOSDCLogo"))
        return view
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
        addSubview(imageView)
        addSubview(infoButton)
        addLayoutGuide(naviBarLayoutGuide)
        autoLayout()
    }
    
    private func autoLayout() {
        naviBarLayoutGuide.snp.makeConstraints { (make) in
            make.top.equalTo(UIApplication.shared.statusBarFrame.height)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(7)
            make.centerY.equalTo(naviBarLayoutGuide)
            make.width.equalTo(81)
            make.height.equalTo(29)
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



final
class TimeTableViewController: UIViewController {
    
    private let naviBar: TimeTableNaivBar = {
        let view = TimeTableNaivBar()
        view.layer.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 1, blur: 10, spread: 0)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.addSubview(naviBar)
        autoLayout()
    }
    
    private func autoLayout() {
        naviBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(navigationController!.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height)
        }
    }
}
