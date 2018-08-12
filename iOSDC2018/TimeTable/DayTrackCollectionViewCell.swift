//
//  DayTrackCollectionViewCell.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/12.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result

final
class DayTrackCollectionViewCellDateHeader: UIView {
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pingFang(size: 18)
        label.text = "8月31日"
        label.textColor = .darkGray
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(dayLabel)
        autoLayout()
    }
    
    private func autoLayout() {
        dayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(18)
            make.width.height.greaterThanOrEqualTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final
class DayTrackCollectionViewCell: UICollectionViewCell {
    private let dateHeader = DayTrackCollectionViewCellDateHeader()
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.tableFooterView = UIView()
        view.separatorColor = .clear
        view.showsVerticalScrollIndicator = false
        view.register(TrackTableViewCell.self, forCellReuseIdentifier: TrackTableViewCell.description())
        return view
    }()
    
    weak var selectTrackAction: Action<Int, Int, NoError>? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dateHeader)
        addSubview(tableView)
        autoLayout()
        clipsToBounds = true
    }
    
    private func autoLayout() {
        dateHeader.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(43)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(dateHeader.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectTrackAction = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DayTrackCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableViewCell.description(), for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        selectTrackAction?.apply(indexPath.row).start()
    }
}

final
class TrackTableViewCell: UITableViewCell {
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoMono", size: 10)
        label.textColor = .white
        label.text = "10:00 ~ 10:15"
        return label
    }()
    
    private let profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12.5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "~~ †††† 漆黒の魔法 Objecitve-C Runtime API †††† ~~"
        label.numberOfLines = 0
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.cornerRadius = 7
        layer.colors = [UIColor.hex("F76B1C").cgColor, UIColor.hex("FEAD3F").cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint   = CGPoint(x: 1, y: 0.5)
        return layer
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(containerView)
        containerView.layer.addSublayer(gradientLayer)
        containerView.addSubview(timeLabel)
        containerView.addSubview(profileImage)
        containerView.addSubview(titleLabel)
        autoLayout()
    }
    
    private func autoLayout() {
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(7)
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.left)
            make.top.equalTo(timeLabel.snp.bottom).offset(6)
            make.size.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp.bottom).offset(6)
            make.left.equalTo(profileImage.snp.right).offset(12)
            make.bottom.equalTo(-8)
            make.right.equalTo(-8)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.top.equalTo(6)
            make.bottom.equalTo(-6)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = containerView.bounds
        containerView.layer.applySketchShadow(color: .black, alpha: 0.2, x: 0, y: 2, blur: 7, spread: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
