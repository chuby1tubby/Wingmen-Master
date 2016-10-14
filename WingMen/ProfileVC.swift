//
//  ProfileVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/11/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userImage: RoundedImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 1000
        userImage.image = userImg
    }
}
