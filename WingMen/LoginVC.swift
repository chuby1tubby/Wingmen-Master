//
//  LoginVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/10/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func facebookRecognizer(_ sender: AnyObject) {
        socialMediaSelection = "Facebook Login Screen"
        performSegue(withIdentifier: "mediaSegue", sender: self)
    }
    
    @IBAction func twitterRecognizer(_ sender: AnyObject) {
        socialMediaSelection = "Twitter Login Screen"
        performSegue(withIdentifier: "mediaSegue", sender: self)
    }
    
    @IBAction func googleRecognizer(_ sender: AnyObject) {
        socialMediaSelection = "Google Login Screen"
        performSegue(withIdentifier: "mediaSegue", sender: self)
    }
}
