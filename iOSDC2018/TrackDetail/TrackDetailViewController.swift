//
//  TrackDetailViewController.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/12.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit

fileprivate let ContainerHeight: CGFloat = UIScreen.main.bounds.width > 320 ? 300 : 320

final
class TrackDetailViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = " bannzai"
        label.font = UIFont.pingFang(size: 13)
        label.textColor = UIColor.hex("4A4A4A")
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pingFangMedium(size: 15)
        label.numberOfLines = 0
        label.text = "~~ †††† 漆黒の魔法 Objecitve-C Runtime API †††† ~~ "
        label.textColor = UIColor.hex("4A4A4A")
        return label
    }()
    
    private let detailTextView: UITextView = {
        let view = UITextView()
        view.textColor = UIColor.hex("9B9B9B")
        view.font = UIFont.pingFang(size: 11)
        view.contentInset = .zero
        view.text =
        """
        やめて！Objective-Cの黒魔術でRuntime APIで色々されたら、闇のコードと繋がっているiOSアプリエンジニアの精神まで燃え尽きちゃう。お願い、機能してXcode。あなたがここで倒れちゃうとマネージャーや社長との約束はどうなっちゃうの。ライフはまだ残っている。ここを耐えれば納期に間に合うんだから。次回「城n(ry
        
        Objective-Cの黒魔術を用いて闇のコードを紹介していきます。
        """
        return view
    }()
    
    private let addToListButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.hex("4A4A4A")
        button.setTitle("リストに追加", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 21
        button.titleLabel?.font = UIFont.pingFangMedium(size: 13)
        return button
    }()
    
    private let removeFromListButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var dismissTap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        view.addGestureRecognizer(tap)
        return tap
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(profileImageView)
        containerView.addSubview(detailTextView)
        containerView.addSubview(addToListButton)
        containerView.addSubview(removeFromListButton)
        autoLayout()
        setupAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        appearAnimation()
    }
    
    private func autoLayout() {
        containerView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(ContainerHeight)
            make.bottom.equalToSuperview().offset(ContainerHeight)
        }
        
        profileImageView.snp.makeConstraints { (make) in
            make.top.left.equalTo(18)
            make.size.equalTo(30)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImageView)
            make.left.equalTo(profileImageView.snp.right).offset(7)
            make.right.equalTo(-18)
            make.height.greaterThanOrEqualTo(0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.greaterThanOrEqualTo(0)
        }
        
        detailTextView.snp.makeConstraints { (make) in
            make.left.equalTo(18)
            make.right.equalTo(-18)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalTo(-100)
        }
        
        addToListButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(188)
            make.height.equalTo(42)
            make.bottom.equalTo(-39)
        }
    }
    
    private func setupAction() {
        dismissTap.reactive.stateChanged.take(during: reactive.lifetime).observeValues { [weak self] _ in
            self?.dismissAnimation()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerView.layer.applySketchShadow(color: .black, alpha: 0.4, x: 0, y: 1, blur: 10, spread: 3)
        addToListButton.layer.applySketchShadow(color: .black, alpha: 0.2, x: 0, y: 1, blur: 7, spread: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrackDetailViewController {
    func appearAnimation() {
        containerView.snp.updateConstraints { (make) in
            make.bottom.equalToSuperview().offset(20)
        }
        UIView.animate(withDuration: 0.12, delay: 0, options: UIViewAnimationOptions(rawValue: 7 << 16 | UIViewAnimationOptions.allowAnimatedContent.rawValue), animations: {
            self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.7)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func dismissAnimation() {
        containerView.snp.updateConstraints { (make) in
            make.bottom.equalToSuperview().offset(ContainerHeight)
        }
        UIView.animate(withDuration: 0.12, delay: 0.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

