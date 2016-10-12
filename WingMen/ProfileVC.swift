//
//  ProfileVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/11/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var nameTitleLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userJobLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTitleLbl.text = userChoice
        userImage.image = userImg
        userJobLbl.text = userJob
    }
}
