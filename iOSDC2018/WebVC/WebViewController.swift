//
//  WebInfoViewController.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/19.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit
import WebKit

final class WebInfoViewController: UIViewController {
    private let webView: WKWebView = {
        let view = WKWebView()
        return view
    }()
    
    let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(webView)
        autoLayout()
        webView.load(URLRequest(url: url))
        webView.reactive.producer(forKeyPath: "title").take(during: reactive.lifetime).startWithValues { [weak self] (value) in
            if let title = value as? String {
                self?.navigationItem.title = title
            }
        }
    }
  
    private func autoLayout() {
        webView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
