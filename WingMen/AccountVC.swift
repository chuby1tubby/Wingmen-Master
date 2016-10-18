//
//  AccountVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/10/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var userProfileImage: RoundedImage!
    @IBOutlet weak var jobTitleLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var aboutMeTxt: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLbl.text = "My Profile"
        userProfileImage.image = #imageLiteral(resourceName: "profile2")
        jobTitleLbl.text = "Photographer"
        locationLbl.text = "Azusa, CA"
//        aboutMeTxt.text = ""
    }
}
