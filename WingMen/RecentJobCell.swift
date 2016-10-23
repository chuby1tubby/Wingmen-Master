//
//  RecentJobCell.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/21/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class RecentJobCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var jobLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var hoursAgoLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        descriptionLbl.sizeToFit()
    }
    
    func configureCell(_ image: UIImage, nameTxt: String, jobTxt: String, locationTxt: String, hoursAgo: Double) {
        mainImg.image = image
        nameLbl.text = nameTxt
        jobLbl.text = jobTxt
        locationLbl.text = locationTxt
        hoursAgoLbl.text = "\(hoursAgo)"
        descriptionLbl.text = "I need a photographer who can take my portrait for a LinkedIn profile picture. Must have a good camera!"
    }
}
