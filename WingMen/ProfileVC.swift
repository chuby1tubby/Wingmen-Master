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
//    @IBOutlet weak var userJobTitleLbl: UILabel!
    @IBOutlet weak var userRatingLbl: UILabel!
    @IBOutlet weak var aboutUserLbl: UILabel!
    @IBOutlet weak var bioTxtBox: UITextView!
    @IBOutlet weak var starOverlayImage: UIImageView!
    @IBOutlet weak var starUnderlayView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 850
        userImage.image = userImg
        if userImg == #imageLiteral(resourceName: "profile1") {
            userImage.image = #imageLiteral(resourceName: "profile1Blurred")
        }
        userNameTitle.text = userName
        userNameLabel.text = userName
//        userJobTitleLbl.text = userJob
        userRatingLbl.text = "\(userRating!)"
        aboutUserLbl.text = "About \(userFirstName!):"
        setStarImages()
    }
    
    func setStarImages() {
        let thisRating = currentUser.rating
        let percentageRating = CGFloat(thisRating * 0.1)
        widthConstraint.constant = percentageRating * starOverlayImage.frame.size.width
    }
}
