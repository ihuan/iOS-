//
//  ViewController.swift
//  SwiftJSDemo
//
//  Created by Tonio on 2019/10/23.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupWebView()
    }

    func setupWebView() {
        webView.frame = view.frame
        let config = WKWebViewConfiguration()
        config.preferences = WKPreferences()
        config.preferences.minimumFontSize = 10
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = false
        config.processPool = WKProcessPool()
        config.userContentController = WKUserContentController()
        config.userContentController.add(self, name: "WKMesesgaSignal")
        
        //webView
        webView = WKWebView(frame: view.bounds, configuration: config)
        view.addSubview(webView)
        let url = Bundle.main.url(forResource: "index", withExtension: "html")
        webView.load(URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 15))
    }

}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
         print(message.body)
        // 如果是返回的json，可以这样接收
        // let Dict = message.body as! Dictionary<String, String>
        
        
        // Native Call JS
        self.webView.evaluateJavaScript("javascript:sayHelloCallBack()") { (val, error) in
            print(error.debugDescription)
            print(val!)
        }
     }
}

