//
//  ProfilesListVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/9/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

var userChoice: String!
var userImg: UIImage!
var userJob: String!

class ProfilesListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var img: UIImage!
    var name: String!
    var job: String!
    var location: String!
    var rating: String!
    
    var imagesArray = [UIImage]()
    
    var namesArray = ["Kyle Nakamura",      "Christian Kama",   "Caleb Linden",     "Walker Eudy",      "Collin Baughn",
                      "Jeremy Clarkson",    "John Whitmire",    "Nathaniel Graham", "Carlos Manzano",   "Mario Fibonacci",
                      "Deanna Johnson",     "Kaylee Northrup",  "Sarah Montgomery", "Ashlee Reed",      "Katelyn Kadmin",
                      "Noah Garcias",       "Danny Phantom",    "E.J. Delacruz",    "Caleb Danielson",  "Bruce Wayne",
                      "Keegan Rusinek",     "Errol Kama",       "Maddie Martin",    "Dashon Martin",    "Donald Drumpf"]
    
    var jobsArray = ["Photographer", "Personal Trainer", "Graphic Designer", "Military Combatant", "Military Training"]
    //var locationsArray = ["Azusa, CA", "Azusa, CA", "Azusa, CA", "S. Korea", "S. Korea"]
    var ratingsArray = ["9.9", "8.3", "8.7", "8.2", "8.8",
                        "9.3", "8.3", "8.7", "9.2", "8.8",
                        "9.2", "8.3", "8.9", "8.2", "9.8",
                        "9.0", "8.1", "8.7", "8.2", "8.8",
                        "9.2", "8.3", "8.7", "8.2", "1.8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userChoice = namesArray[indexPath.row]
        userImg = imagesArray[indexPath.row]
        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        for count in 1...25 {
            imagesArray.append(UIImage(named: "profile\(count).jpg")!)
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell") as? ProfileCell {
            
            img = imagesArray[indexPath.row]
            name = namesArray[indexPath.row]
            //job = jobsArray[indexPath.row]
            job = "Wingman"
            //location = locationsArray[indexPath.row]
            location = "Azusa, CA"
            rating = ratingsArray[indexPath.row]
            
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
        return namesArray.count
    }
}

