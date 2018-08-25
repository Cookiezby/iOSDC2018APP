//
//  StaffViewController.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/21.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result
import SDWebImage
import MBProgressHUD

final class StaffViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.separatorColor = .clear
        view.delegate = self
        view.dataSource = self
        view.tableFooterView = UIView()
        view.register(StaffTableViewCell.self, forCellReuseIdentifier: StaffTableViewCell.description())
        return view
    }()
    
    private let viewModel = StaffViewModel()
    private var hud: MBProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "スタッフ"
        view.addSubview(tableView)
        autoLayout()
        bind(viewModel)
        viewModel.fetchStaff()
    }
    
    private func autoLayout() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func bind(_ viewModel: StaffViewModel) {
        viewModel.sections.signal.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.pushVCAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (vc, animated) in
            self?.navigationController?.pushViewController(vc, animated: animated)
        }
        
        viewModel.hudHidden.signal.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (hidden) in
            guard let view = self?.view else { return }
            if hidden {
                self?.hud?.hide(animated: true)
            } else {
                self?.hud = MBProgressHUD.showAdded(to: view, animated: true)
            }
        }
        
        viewModel.errorMessageAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (message) in
            guard let view = self?.view else { return }
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.label.text = message
            hud.mode = .text
            hud.hide(animated: true, afterDelay: 1.0)
        }
    }
}


extension StaffViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections.value[section].staffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StaffTableViewCell.description()) as! StaffTableViewCell
        cell.setStaff(viewModel.sections.value[indexPath.section].staffs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectStaffAtIndexPathAction.apply(indexPath).start()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = StaffSectonHeader(text: viewModel.sections.value[section].sectionHeader)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

final class StaffTableViewCell: UITableViewCell {
    private let avatarView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.pingFangMedium(size: 12)
        label.textColor = UIColor.mainTextColor
        return label
    }()
    
    private let linkIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "LinkIcon"))
        return view
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
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(container)
        container.addSubview(avatarView)
        container.addSubview(label)
        container.addSubview(linkIcon)
        autoLayout()
    }
    
    private func autoLayout() {
        container.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
        }
        
        avatarView.layer.cornerRadius = 16
        avatarView.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.centerY.equalToSuperview()
            make.size.equalTo(32)
        }
        
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(avatarView.snp.right).offset(10)
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        linkIcon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
            make.size.equalTo(14)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarView.image = nil
    }
    
    func setStaff(_ staff: Staff) {
        label.text = staff.name
        SDWebImageManager.shared().imageDownloader?.downloadImage(with: URL(string: staff.avatarURL), options: .lowPriority, progress: nil) { (image, data, error, fiished) in
            self.avatarView.image = image?.resize(newSize: CGSize(width: 64, height: 64))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class StaffSectonHeader: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainTextColor
        label.font = UIFont.pingFangMedium(size: 10)
        return label
    }()
    
    init(text: String) {
        super.init(frame: .zero)
        backgroundColor = .white
        label.text = text
        addSubview(label)
        autoLayout()
    }
    
    private func autoLayout() {
        label.snp.makeConstraints { (make) in
            make.bottom.equalTo(-5)
            make.left.equalTo(12)
            make.width.height.greaterThanOrEqualTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
