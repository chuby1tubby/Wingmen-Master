//
//  CollectionViewCell.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/25/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ jobTxt: String, img: UIImage) {
        textLabel.text = jobTxt
        imageView.image = img
    }
}
