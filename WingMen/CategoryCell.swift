//
//  CategoryCell.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/11/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var jobLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ jobTxt: String) {
        //mainImg.image = image
        jobLbl.text = jobTxt
    }
}
