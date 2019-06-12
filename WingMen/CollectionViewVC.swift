//
//  CollectionViewVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/25/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class CollectionViewVC: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var jobsArray = ["Any Wingman", "Baby Sitter", "Graphic Designer", "Mover", "Photographer", "Tax Accounting", "Tutor"]
    let categoryImagesArray = [#imageLiteral(resourceName: "icon_wing"), #imageLiteral(resourceName: "category_babySitter"), #imageLiteral(resourceName: "category_garphicDesigner"), #imageLiteral(resourceName: "category_mover"), #imageLiteral(resourceName: "category_photography"), #imageLiteral(resourceName: "category_accounting"), #imageLiteral(resourceName: "category_tutor")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // Do any additional setup after loading the view, typically from a nib
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth / 3, height: screenWidth / 3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        let rectangle = CGRect(x: 0, y: 60, width: screenWidth, height: screenHeight-60)
        collectionView = UICollectionView(frame: rectangle, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        if #available(iOS 10.0, *) {
            let wingmenYellow: UIColor = UIColor(colorLiteralRed: 249/255, green: 220/255, blue: 70/255, alpha: 1.0)
            collectionView!.backgroundColor = wingmenYellow
        } else {
            // Fallback on earlier versions
        }
        self.view.addSubview(collectionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Code
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.5
        cell.frame.size.width = screenWidth / 3
        cell.frame.size.height = screenWidth / 3
        
        cell.textLabel.text = "\(indexPath.section):\(indexPath.row)"
        return cell
    }
}
