//
//  SocialMediaLoginVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/11/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

var socialMediaSelection: String!

class SocialMediaLoginVC: UIViewController {
    
    @IBOutlet weak var titleTxt: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleTxt.text = socialMediaSelection
    }
}
