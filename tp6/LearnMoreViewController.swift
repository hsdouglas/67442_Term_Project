//
//  LearnMoreViewController.swift
//  
//
//  Created by Hannah Stucken Douglas on 12/9/15.
//
//

import UIKit
import WebKit

class LearnMoreViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        view = webView
    }
    
    /* the webview shows the PlannedParenthood page to allow for microtasking on behalf of the user */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://www.plannedparenthood.org/teens/my-body")
        webView.loadRequest(NSURLRequest(URL: url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
