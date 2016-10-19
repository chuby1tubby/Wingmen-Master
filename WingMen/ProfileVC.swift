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
    @IBOutlet weak var userNameTitle: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userJobTitleLbl: UILabel!
    @IBOutlet weak var userRatingLbl: UILabel!
    @IBOutlet weak var aboutUserLbl: UILabel!
    @IBOutlet weak var bioTxtBox: UITextView!
    @IBOutlet weak var star1: UIView!
    @IBOutlet weak var star2: UIView!
    @IBOutlet weak var star3: UIView!
    @IBOutlet weak var star4: UIView!
    @IBOutlet weak var star5: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 1000
        userImage.image = userImg
        userNameTitle.text = userName
        userNameLabel.text = userName
        userJobTitleLbl.text = userJob
        userRatingLbl.text = "\(userRating!)"
        aboutUserLbl.text = "About \(userFirstName!):"
        setStarImages()
    }
    
    func setStarImages() {
        let thisRating = currentUser.rating
        if thisRating >= 0 && thisRating < 2 {
            self.star1.backgroundColor = UIColor.yellow
            self.star2.backgroundColor = UIColor.white
            self.star3.backgroundColor = UIColor.white
            self.star4.backgroundColor = UIColor.white
            self.star5.backgroundColor = UIColor.white
        } else if thisRating >= 2 && thisRating < 4 {
            self.star1.backgroundColor = UIColor.yellow
            self.star2.backgroundColor = UIColor.yellow
            self.star3.backgroundColor = UIColor.white
            self.star4.backgroundColor = UIColor.white
            self.star5.backgroundColor = UIColor.white
        } else if thisRating >= 4 && thisRating < 6 {
            self.star1.backgroundColor = UIColor.yellow
            self.star2.backgroundColor = UIColor.yellow
            self.star3.backgroundColor = UIColor.yellow
            self.star4.backgroundColor = UIColor.white
            self.star5.backgroundColor = UIColor.white
        } else if thisRating >= 6 && thisRating < 8 {
            self.star1.backgroundColor = UIColor.yellow
            self.star2.backgroundColor = UIColor.yellow
            self.star3.backgroundColor = UIColor.yellow
            self.star4.backgroundColor = UIColor.yellow
            self.star5.backgroundColor = UIColor.white
        } else if thisRating >= 8 && thisRating <= 10 {
            self.star1.backgroundColor = UIColor.yellow
            self.star2.backgroundColor = UIColor.yellow
            self.star3.backgroundColor = UIColor.yellow
            self.star4.backgroundColor = UIColor.yellow
            self.star5.backgroundColor = UIColor.yellow
        }
    }
}
