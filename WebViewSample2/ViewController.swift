//
//  ViewController.swift
//  WebViewSample2
//
//  Created by Seino Yoshinori on 2020/05/22.
//  Copyright © 2020 yoshinori. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet
    weak var webView: WKWebView!
    
    @IBOutlet
    weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.webView.navigationDelegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        // webserverにアクセスする場合
//        self.webView.load(URLRequest(url: URL(string: "http://192.168.XXX.XXX:3000/")!))
        
        // localファイルにアクセスする場合
        let localurl = Bundle.main.url(forResource: "dist/index", withExtension: "html")!
        webView.loadFileURL(localurl, allowingReadAccessTo: localurl)
    }
    
    @IBAction func onTouchUpInside(_ sender: Any) {
        let execJsFunc = "$nuxt.$router.push('/inspire')"
        
        self.webView.evaluateJavaScript(execJsFunc, completionHandler: nil)
    }
}


extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
}
