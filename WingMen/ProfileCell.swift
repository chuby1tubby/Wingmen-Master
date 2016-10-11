//
//  ProfileCell.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/10/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var jobLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ image: UIImage, nameTxt: String, jobTxt: String, locationTxt: String, ratingTxt: String) {
        mainImg.image = image
        nameLbl.text = nameTxt
        jobLbl.text = jobTxt
        locationLbl.text = locationTxt
        ratingLbl.text = ratingTxt
    }
}
