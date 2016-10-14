//
//  ProfilesListVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/9/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

var userName: String!
var userImg: UIImage!
var userJob: String!

class ProfilesListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userName = wingmenArray[indexPath.row].firstName + wingmenArray[indexPath.row].lastName
        userImg = wingmenArray[indexPath.row].image
        userJob = wingmenArray[indexPath.row].job
        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var currentUser: Wingman!
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell") as? ProfileCell {
            currentUser = wingmenArray[indexPath.row]
            cell.configureCell(currentUser.image, nameTxt: (currentUser.firstName + " " + currentUser.lastName), jobTxt: currentUser.job, locationTxt: currentUser.location, ratingNum: currentUser.rating)
            return cell
        } else {
            return ProfileCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wingmenArray.count
    }
}

