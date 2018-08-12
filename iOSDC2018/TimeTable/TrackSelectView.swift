//
//  TrackSelectView.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit

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
        view.register(TrackSelectViewCell.self, forCellReuseIdentifier: TrackSelectViewCell.description())
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(tableView)
        autoLayout()
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrackSelectViewCell.description(), for: indexPath) as! TrackSelectViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

final class TrackSelectViewCell: UITableViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.text = "A"
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        separatorInset = UIEdgeInsetsMake(0, bounds.width, 0, 0)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
