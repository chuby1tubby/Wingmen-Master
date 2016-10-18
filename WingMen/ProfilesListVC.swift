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
var userRating: Double!
var userLocation: String!
var userFirstName: String!
var currentUser: Wingman!

class ProfilesListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var myCount = 0
    
    override func viewWillAppear(_ animated: Bool) {
        for man in wingmenArray {
            if man.job == jobCategoryChoice || jobCategoryChoice == "Any Wingman" {
                myCount += 1
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userName = limitedWingmenArray[indexPath.row].firstName + " " +  limitedWingmenArray[indexPath.row].lastName
        userFirstName = limitedWingmenArray[indexPath.row].firstName
        userImg = limitedWingmenArray[indexPath.row].image
        userJob = limitedWingmenArray[indexPath.row].job
        userRating = limitedWingmenArray[indexPath.row].rating
        userLocation = limitedWingmenArray[indexPath.row].location

        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell") as? ProfileCell {
            currentUser = limitedWingmenArray[indexPath.row]
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
        return myCount
    }
}

