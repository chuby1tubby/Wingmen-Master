//
//  SearchVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/5/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

var jobCategoryChoice: String!

class SearchVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var img: UIImage!
    var job: String!
    
    var imagesArray = [#imageLiteral(resourceName: "kyleImage"), #imageLiteral(resourceName: "kamaImage"), #imageLiteral(resourceName: "calebImage"), #imageLiteral(resourceName: "eudyImage"), #imageLiteral(resourceName: "baugnImage")]
    var jobsArray = ["Photraphers", "Personal Trainers", "Graphic Designers", "Military Combat", "Military Trainers"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        jobCategoryChoice = jobsArray[indexPath.row]
        performSegue(withIdentifier: "listSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "JobCategoryCell") as? CategoryCell {
            img = imagesArray[indexPath.row]
            job = jobsArray[indexPath.row]
            
            cell.configureCell(img, jobTxt: job)
            return cell
        } else {
            return CategoryCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
