//
//  TrackDetailViewController.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/12.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit

fileprivate let ContainerHeight: CGFloat = 280

final
class TrackDetailViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var dismissTap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        view.addGestureRecognizer(tap)
        return tap
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        autoLayout()
        setupAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        appearAnimation()
    }
    
    private func autoLayout() {
        containerView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(280)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(ContainerHeight)
        }
    }
    
    private func setupAction() {
        dismissTap.reactive.stateChanged.take(during: reactive.lifetime).observeValues { [weak self] _ in
            self?.dismissAnimation()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerView.layer.applySketchShadow(color: .black, alpha: 0.2, x: 0, y: 1, blur: 10, spread: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrackDetailViewController {
    func appearAnimation() {
        containerView.snp.updateConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.7)
            self.view.layoutIfNeeded()
        }) { (_) in
        }
    }
    
    func dismissAnimation() {
        containerView.snp.updateConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(ContainerHeight)
        }
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

