//
//  DetailViewController.swift
//  practica2
//
//  Created by Luis Roberto Blancas Lemini on 30/05/22.
//

import UIKit
import WebKit

class DetailURLViewController: UIViewController, WKNavigationDelegate {
    
    let url: String
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    private func loadWebView() {
        let webV: WKWebView = WKWebView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
        guard let safeURL = URL(string: url) else { return }
        webV.navigationDelegate = self
        webV.load(URLRequest(url: safeURL))
        self.view.addSubview(webV)
    }
    
}

