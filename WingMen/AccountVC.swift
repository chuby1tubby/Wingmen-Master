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
    @IBOutlet weak var flipButtonView: UIView!
    @IBOutlet weak var flipButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLbl.text = "My Profile"
        
        userProfileImage.image = #imageLiteral(resourceName: "profile2")
        if isSignedInAsWingman == true {
            flipButtonView.isHidden = false
        } else {
            flipButtonView.isHidden = true
        }
    }
}
