//
//  RealCircleImage.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/23/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class RealCircleImage: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.customInit();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.customInit();
    }
    
    func customInit() {
        self.layer.cornerRadius = layer.frame.size.width/2
    }
}
