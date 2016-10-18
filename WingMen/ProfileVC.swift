//
//  ProfileVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/11/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

// Global variables:
// userName, userImg, userJob

class ProfileVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userImage: RoundedImage!
    @IBOutlet weak var userNameTitle: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userJobTitleLbl: UILabel!
    @IBOutlet weak var userRatingLbl: UILabel!
    @IBOutlet weak var aboutUserLbl: UILabel!
    @IBOutlet weak var bioTxtBox: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 1000
        userImage.image = userImg
        userNameTitle.text = userName
        userNameLabel.text = userName
        userJobTitleLbl.text = userJob
        userRatingLbl.text = "\(userRating!)"
        aboutUserLbl.text = "About \(userFirstName!):"
    }
}
