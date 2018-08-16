//
//  MyFavProposalCollectionCell.swift
//  iOSDC2018
//
//  Created by 朱　冰一 on 2018/08/15.
//  Copyright © 2018年 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

final class MyFavProposalCollectionCell: UICollectionViewCell {
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.tableFooterView = UIView()
        view.separatorColor = .clear
        view.showsVerticalScrollIndicator = false
        view.register(FavProposalTableViewCell.self, forCellReuseIdentifier: FavProposalTableViewCell.description())
        return view
    }()
    
    weak var selectProposalAction: Action<Proposal, Proposal, NoError>? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(dateLabel)
        autoLayout()
    }
    
    var favProposal: FavProposal? {
        didSet {
            dateLabel.text = favProposal?.date.monthDayStr()
        }
    }
    
    func setFavProposal(_ favProposal: FavProposal) {
        self.favProposal = favProposal
        tableView.reloadData()
    }
    
    private func autoLayout() {
        dateLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(tableView.snp.top).offset(-3)
            make.left.equalTo(13)
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(40)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        favProposal = nil
        selectProposalAction = nil
        tableView.contentOffset = .zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyFavProposalCollectionCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favProposal?.proposals.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavProposalTableViewCell.description(), for: indexPath) as! FavProposalTableViewCell
        if let proposal = favProposal?.proposals[indexPath.row] {
            cell.setProposal(proposal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let proposal = favProposal?.proposals[indexPath.row] {
            selectProposalAction?.apply(proposal).start()
        }
    }
}



