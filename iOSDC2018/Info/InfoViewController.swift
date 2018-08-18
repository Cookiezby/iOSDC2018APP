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
    
    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "情報"
        let button = UIBarButtonItem(image: UIImage(named: "CloseButton"), style: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = button
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor.hex("221815")
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
