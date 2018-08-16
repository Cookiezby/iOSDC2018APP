//
//  TrackSelectView.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import Result

protocol TrackSelectViewInOut {
    var selectedDay: MutableProperty<DayProposal> { get }
    var myFavHidden: MutableProperty<Bool> { get }
}

final
class TrackSelectView: UIView {
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.isScrollEnabled = false
        view.tableFooterView = UIView()
        view.backgroundView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
        view.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        view.register(TrackSelectViewCell.self, forCellReuseIdentifier: TrackSelectViewCell.description())
        view.register(FavSelectViewCell.self, forCellReuseIdentifier: FavSelectViewCell.description())
        view.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        return view
    }()
    
    private let selectedDay = MutableProperty<DayProposal>(ProposalAdapter.shared.dayProposalList[0])
    private let myFavHidden = MutableProperty<Bool>(true)
    init() {
        super.init(frame: .zero)
        addSubview(tableView)
        autoLayout()
    }
    
    func bind(_ inOut: TrackSelectViewInOut) {
        inOut.selectedDay <~ selectedDay.signal.take(during: reactive.lifetime)
        inOut.myFavHidden <~ myFavHidden.signal.take(during: reactive.lifetime)
    }
    
    private func autoLayout() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrackSelectView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return ProposalAdapter.shared.dayProposalList.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TrackSelectViewCell.description(), for: indexPath) as! TrackSelectViewCell
            cell.label.text = ProposalAdapter.shared.dayProposalList[indexPath.row].date.dayStr()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: FavSelectViewCell.description(), for: indexPath) as! FavSelectViewCell
            return cell
        default:
            return UITableViewCell()
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            selectedDay.swap(ProposalAdapter.shared.dayProposalList[indexPath.row])
            myFavHidden.value = true
        case 1:
            myFavHidden.value = false
        default:
            break
        }
    }
}

final class FavSelectViewCell: UITableViewCell {
    private let iconView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "MyFavOn"))
        view.contentMode = .center
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset = UIEdgeInsetsMake(0, bounds.width, 0, 0)
        addSubview(iconView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        iconView.alpha = selected ? 1.0 : 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class TrackSelectViewCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoMono", size: 13)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let circleBack: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.hex("4A4A4A").cgColor
        layer.isHidden = true
        layer.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 1, blur: 6, spread: 0)
        return layer
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        separatorInset = UIEdgeInsetsMake(0, bounds.width, 0, 0)
        layer.addSublayer(circleBack)
        addSubview(label)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        label.textColor = selected ? .white : .darkGray
        circleBack.isHidden = selected ? false : true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
        circleBack.bounds = bounds.insetBy(dx: 6, dy: 6)
        circleBack.position = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        circleBack.cornerRadius = circleBack.bounds.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
