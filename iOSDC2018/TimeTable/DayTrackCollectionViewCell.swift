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
import SDWebImage

final
class DayTrackCollectionViewCellTrackHeader: UIView {
    var track:Track? = nil {
        didSet {
            if let track = track {
                trackLabel.text = track.rawValue
            }
        }
    }

    private let trackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pingFang(size: 17)
        label.textColor = UIColor.mainTextColor
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(trackLabel)
        autoLayout()
    }
    
    private func autoLayout() {
        trackLabel.snp.makeConstraints { (make) in
            make.left.equalTo(14)
            make.width.height.greaterThanOrEqualTo(0)
            make.bottom.equalTo(-2)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final
class DayTrackCollectionViewCell: UICollectionViewCell {
    private let dateHeader = DayTrackCollectionViewCellTrackHeader()
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.tableFooterView = UIView()
        view.separatorColor = .clear
        view.showsVerticalScrollIndicator = false
        view.contentInset = UIEdgeInsetsMake(0, 0, 20, 0)
        view.register(PropodalTableViewCell.self, forCellReuseIdentifier: PropodalTableViewCell.description())
        return view
    }()
    
    private let emptyView = ProposalEmptyView()
    
    weak var selectProposalAction: Action<Proposal, Proposal, NoError>? = nil
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dateHeader)
        addSubview(emptyView)
        addSubview(tableView)
        autoLayout()
        clipsToBounds = true
    }
    
    var trackProposal: TrackProposal? = nil {
        didSet {
            if let trackProposal = trackProposal {
                dateHeader.track = trackProposal.track
                tableView.isHidden = trackProposal.proposals.count == 0
            }
        }
    }
    
    private func autoLayout() {
        dateHeader.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(dateHeader.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        emptyView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setTrackProposal(_ trackProposal: TrackProposal) {
        self.trackProposal = trackProposal
        tableView.reloadData()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectProposalAction = nil
        tableView.contentOffset = .zero
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
        return trackProposal?.proposals.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropodalTableViewCell.description(), for: indexPath) as! PropodalTableViewCell
        if let proposal = trackProposal?.proposals[indexPath.row] {
             cell.setProposal(proposal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let proposal = trackProposal?.proposals[indexPath.row] {
            selectProposalAction?.apply(proposal).start()
        }
    }
}

class PropodalTableViewCell: UITableViewCell {
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoMono", size: 11)
        label.textColor = .white
        return label
    }()
    
    let profileImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.cornerRadius = 7
        layer.speed = 100
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint   = CGPoint(x: 1, y: 0.5)
        return layer
    }()
    
    private let favLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.isHidden = true
        return label
    }()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(containerView)
        containerView.layer.addSublayer(gradientLayer)
        containerView.addSubview(timeLabel)
        containerView.addSubview(profileImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(favLabel)
        autoLayout()
    }
    
    func setProposal(_ proposal: Proposal) {
        SDWebImageManager.shared().imageDownloader?.downloadImage(with: URL(string: proposal.speaker.avatarURL), options: .lowPriority, progress: nil) { (image, data, error, fiished) in
            self.profileImage.image = image?.resize(newSize: CGSize(width: 50, height: 50))
        }
        titleLabel.text = proposal.title
        let startTimeStr = timeFormatter.string(from: Date(timeIntervalSince1970: proposal.timetable.startsAt))
        let endTimeStr   = timeFormatter.string(from: Date(timeIntervalSince1970: proposal.timetable.startsAt + Double(proposal.timetable.lengthMin * 60)))
        timeLabel.text = startTimeStr + " ~ " + endTimeStr
        
        favLabel.isHidden = !MyFavProposalManager.shared.contains(id: proposal.id)
        
        switch proposal.timetable.track {
        case .A:
            gradientLayer.colors = [UIColor.hex("02aab0").cgColor, UIColor.hex("00cdac").cgColor]
        case .B:
            gradientLayer.colors = [UIColor.hex("ff758c").cgColor, UIColor.hex("ff7eb3").cgColor]
        case .C:
            gradientLayer.colors = [UIColor.hex("F76B1C").cgColor, UIColor.hex("FEAD3F").cgColor]
        case .D:
            gradientLayer.colors = [UIColor.hex("56ab2f").cgColor, UIColor.hex("a8e063").cgColor]
        }
    }
    
    private func autoLayout() {
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(7)
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.left)
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.size.equalTo(28)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage.snp.top).offset(-1)
            make.left.equalTo(profileImage.snp.right).offset(12)
            make.bottom.lessThanOrEqualTo(-8)
            make.right.equalTo(-8)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.top.equalTo(6)
            make.bottom.equalTo(-6)
        }
        
        favLabel.sizeToFit()
        favLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.centerY.equalTo(timeLabel)
            make.width.equalTo(favLabel.bounds.width)
            make.height.equalTo(favLabel.bounds.height)
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

final
class FavProposalTableViewCell: PropodalTableViewCell {
    private let trackLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerView.addSubview(trackLabel)
        autoLayout()
    }
    
    private func autoLayout() {
        trackLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.lastBaseline.equalTo(timeLabel.snp.firstBaseline)
            make.width.equalTo(10)
        }
        
        timeLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(26)
            make.top.equalTo(7)
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        profileImage.snp.remakeConstraints { (make) in
            make.left.equalTo(trackLabel)
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.size.equalTo(28)
        }
    }
    
    override func setProposal(_ proposal: Proposal) {
        super.setProposal(proposal)
        switch proposal.timetable.track {
        case .A:
            trackLabel.text = "A"
        case .B:
            trackLabel.text = "B"
        case .C:
            trackLabel.text = "C"
        case .D:
            trackLabel.text = "D"
        }
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
