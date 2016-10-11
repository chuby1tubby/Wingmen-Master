//
//  ProfilesListVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/9/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class ProfilesListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var img: UIImage!
    var name: String!
    var job: String!
    var location: String!
    var rating: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell") as? ProfileCell {
            img = #imageLiteral(resourceName: "profileImage")
            name = "Kyle Nakamura"
            job = "Photographer"
            location = "Azusa, CA"
            rating = "9.1"
            cell.configureCell(img, nameTxt: name, jobTxt: job, locationTxt: location, ratingTxt: rating)
            return cell
        } else {
            return ProfileCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

