//
//  testAccountVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/19/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class testAccountVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 1000
    }

}
