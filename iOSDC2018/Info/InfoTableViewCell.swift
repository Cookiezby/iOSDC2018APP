//
//  InfoTableViewCell.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/18.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit

final class InfoTableViewCell: UITableViewCell {
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .left
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainTextColor
        label.font = UIFont.pingFangMedium(size: 13)
        return label
    }()
    
    private let container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        view.layer.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 1, blur: 6, spread: 0)
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset = UIEdgeInsetsMake(0, bounds.width, 0, 0)
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(container)
        container.addSubview(iconView)
        container.addSubview(label)
        autoLayout()
    }
    
    func setInfo(_ info: Info) {
        iconView.image = info.iconImage
        label.text = info.title
    }
    
    private func autoLayout() {
        container.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
        }
        
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(20)
        }
        
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(43)
            make.width.height.greaterThanOrEqualTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


