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
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


