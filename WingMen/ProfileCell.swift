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
    @IBOutlet weak var mainLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ image: UIImage, text: String) {
        mainImg.image = image
        mainLbl.text = text
    }
}
