//
//  ProfilesListVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/9/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit
import Foundation

var userName: String!
var userImg: UIImage!
var userJob: String!
var userRating: Double!
var userLocation: String!
var userFirstName: String!
var currentUser: Wingman!

class ProfilesListVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Variables
    var myCount = 0
    var filteredWingmen: [Wingman] = []
    var inSearchMode = false
    
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
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    
    // Search bar function
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            tableView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text?.lowercased()
            
            filteredWingmen.removeAll()
            for man in limitedWingmenArray {
                if man.firstName.lowercased().contains(lower!) || man.lastName.lowercased().contains(lower!) {  // If search text matches any part of username
                    filteredWingmen.append(man)
                }
            }
            tableView.reloadData()
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if inSearchMode {
            currentUser = filteredWingmen[indexPath.row]
        } else {
            currentUser = limitedWingmenArray[indexPath.row]
        }
        userName = currentUser.firstName + " " +  limitedWingmenArray[indexPath.row].lastName
        userFirstName = currentUser.firstName
        userImg = currentUser.image
        userJob = currentUser.job
        userRating = currentUser.rating
        userLocation = currentUser.location

        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell") as? ProfileCell {
            if inSearchMode {
                currentUser = filteredWingmen[indexPath.row]
            } else {
                currentUser = limitedWingmenArray[indexPath.row]
            }
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
        if inSearchMode {
            return filteredWingmen.count
        } else {
            return myCount
        }
    }
}

