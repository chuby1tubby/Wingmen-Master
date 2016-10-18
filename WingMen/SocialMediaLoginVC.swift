//
//  SocialMediaLoginVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/11/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit
import WebKit

var socialMediaSelection: String!

class SocialMediaLoginVC: UIViewController, WKNavigationDelegate, WKUIDelegate, UIWebViewDelegate  {
    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    var url: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        titleTxt.text = socialMediaSelection
        loadHomePage()
    }
    
    // Load web view
    func loadHomePage() {
        switch socialMediaSelection {
        case "Facebook Login Screen":
            url = URL(string: "https://www.facebook.com")
        case "Twitter Login Screen":
            url = URL(string: "https://www.twitter.com/login")
        case "Google Login Screen":
            url = URL(string: "https://accounts.google.com/ServiceLogin")
        default:
            url = URL(string: "https://www.facebook.com")
        }
        webView.loadRequest(URLRequest(url: url!))
    }
}
