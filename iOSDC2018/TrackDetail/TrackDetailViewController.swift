//
//  TrackDetailViewController.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/12.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import SafariServices

fileprivate let ContainerHeight: CGFloat = UIScreen.main.bounds.width > 320 ? 330 : 400

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
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let profileBack: CALayer = {
        let layer = CALayer()
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.hex("EAEAEA").cgColor
        return layer
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = " bannzai"
        label.font = UIFont.pingFang(size: 14)
        label.textColor = UIColor.hex("4A4A4A")
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pingFangMedium(size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor.hex("4A4A4A")
        return label
    }()
    
    private let detailTextView: UITextView = {
        let view = UITextView()
        view.textColor = UIColor.hex("909090")
        view.font = UIFont.pingFang(size: 12)
        view.contentInset = .zero
        view.isEditable = false
        return view
    }()
    
    private let twitterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "TwitterButton"), for: .normal)
        button.layer.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 1, blur: 7, spread: 0)
        return button
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
    
    private var proposal: Proposal
    
    init(proposal: Proposal) {
        self.proposal = proposal
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = proposal.title
        detailTextView.text = proposal.abstract
        nameLabel.text = proposal.speaker
        SDWebImageManager.shared().imageDownloader?.downloadImage(with: URL(string: proposal.profileImageURL), options: .highPriority, progress: nil, completed: { (image, data, error, finished) in
            let size = 40 * UIScreen.main.nativeScale
            self.profileImageView.image = image?.resize(newSize: CGSize(width: size, height: size))
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        containerView.layer.addSublayer(profileBack)
        containerView.addSubview(nameLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(profileImageView)
        containerView.addSubview(detailTextView)
        containerView.addSubview(addToListButton)
        containerView.addSubview(removeFromListButton)
        containerView.addSubview(twitterButton)
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
            make.left.equalTo(18)
            make.top.equalTo(15)
            make.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImageView)
            make.left.equalTo(profileImageView.snp.right).offset(10)
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
            make.left.equalTo(17)
            make.right.equalTo(-17)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalTo(-90)
        }
        
        addToListButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(188)
            make.height.equalTo(42)
            make.bottom.equalTo(-39)
        }
        
        twitterButton.snp.makeConstraints { (make) in
            make.width.equalTo(28)
            make.height.equalTo(29)
            make.right.equalTo(-25)
            make.centerY.equalTo(profileImageView)
        }
    }
    
    private func setupAction() {
        dismissTap.reactive.stateChanged.take(during: reactive.lifetime).observeValues { [weak self] _ in
            self?.dismissAnimation()
        }
        
        twitterButton.reactive.controlEvents(.touchUpInside).take(during: reactive.lifetime).observeValues { [weak self] (_) in
            guard let twitterURL = self?.proposal.twitterLink else { return }
            if let url = URL(string: twitterURL) {
                let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                self?.present(safariVC, animated: true, completion: nil)
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerView.layer.applySketchShadow(color: .black, alpha: 0.4, x: 0, y: 1, blur: 10, spread: 3)
        addToListButton.layer.applySketchShadow(color: .black, alpha: 0.2, x: 0, y: 1, blur: 7, spread: 0)
        profileBack.frame = profileImageView.frame.insetBy(dx: -2, dy: -2)
        profileBack.cornerRadius = profileBack.bounds.width / 2
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

