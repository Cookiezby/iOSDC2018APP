//
//  DayTrackEmptyView.swift
//  iOSDC2018
//
//  Created by 朱　冰一 on 2018/08/15.
//  Copyright © 2018年 zhubingyi. All rights reserved.
//

import Foundation
import UIKit

final class DayTrackEmptyView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.tintColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Proposal is Empty"
        label.textAlignment = .center
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(label)
        autoLayout()
    }
    
    private func autoLayout() {
        label.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
