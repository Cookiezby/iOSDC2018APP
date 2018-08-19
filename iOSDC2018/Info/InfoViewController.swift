//
//  InfoViewController.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

final class InfoViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.hex("FAFAFA")
        view.tableFooterView = UIView()
        view.contentInset = UIEdgeInsetsMake(5, 0, 0, 0)
        view.separatorColor = .clear
        view.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.description())
        return view
    }()
    
    private let viewModel = InfoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        view.addSubview(tableView)
        autoLayout()
        bind(viewModel)
    }
    
    private func bind(_ viewModel: InfoViewModel) {
        viewModel.pushVCAction.values.take(during: reactive.lifetime).observe(on: UIScheduler()).observeValues { [weak self] (vc, animated) in
            self?.navigationController?.pushViewController(vc, animated: animated)
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "情報"
        let button = UIBarButtonItem(image: UIImage(named: "CloseButton"), style: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = button
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor.hex("221815")
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layer.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 1, blur: 10, spread: 0)
    }

    private func autoLayout() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    @objc
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}


extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.infoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.description()) as! InfoTableViewCell
        cell.setInfo(viewModel.infoList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.infoList[indexPath.row].action.apply().start()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}
