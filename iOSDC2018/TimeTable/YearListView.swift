//
//  iOSDCYearListView.swift
//  iOSDC2018
//
//  Created by 朱冰一 on 2019/09/02.
//  Copyright © 2019 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result
import SnapKit

protocol YearListViewModel {
    var selectYearAction: Action<iOSDCJapan, iOSDCJapan, NoError> { get }
}

final class YearListView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.red
        tableView.showsVerticalScrollIndicator = false
        tableView.register(YearListTableViewCell.self, forCellReuseIdentifier: YearListTableViewCell.description())
        return tableView
    }()
    
    var selectYearAction: Action<iOSDCJapan, iOSDCJapan, NoError> = { Action { SignalProducer(value: $0) }}()
    var yearListViewHidden = MutableProperty<Bool>(true)
    
    init() {
        defer {
            autoLayout()
        }
        super.init(frame: .zero)
        self.layer.cornerRadius = 5
        self.layer.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 1, blur: 10, spread: 0)
        addSubview(tableView)
    }
    
    func bind(inOut: YearListViewModel) {
        selectYearAction.values.observe(on: UIScheduler()).take(during: reactive.lifetime).observeValues { (value) in
            inOut.selectYearAction.apply(value).start()
        }
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

extension YearListView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iOSDCJapan.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: YearListTableViewCell.description()) as! YearListTableViewCell
        cell.logoImageView.image = iOSDCJapan.all[indexPath.row].logoImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectYearAction.apply(iOSDCJapan.all[indexPath.row]).start()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42.5
    }
}


final class YearListTableViewCell: UITableViewCell {
    
    var logoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var effectView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        effectView.backgroundColor = highlighted ? UIColor(white: 0.0, alpha: 0.1) : UIColor(white: 0.0, alpha: 0.0)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        separatorInset = UIEdgeInsets.zero
        addSubview(logoImageView)
        addSubview(effectView)
        autoLayout()
    }
    
    private func autoLayout() {
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(8)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-8)
        }
        
        effectView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

