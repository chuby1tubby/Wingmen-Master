//
//  CollectionViewController.swift
//  WingMen
//
//  Created by Kyle Nakamura on 11/3/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
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
//        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        collectionView!.dataSource = self
//        collectionView!.delegate = self
        collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
//        collectionView!.backgroundColor = UIColor.green
//        self.view.addSubview(collectionView!)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        cell.frame.size.width = screenWidth / 3
        cell.frame.size.height = screenWidth / 3
        
        cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
        return cell
    }
}
