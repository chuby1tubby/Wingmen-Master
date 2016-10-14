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
    
    // Variables
    var img: UIImage!
    var name: String!
    var job: String!
    var location: String!
    var rating: String!
    
    var imagesArray = [UIImage]()
    
    var namesArray = ["Katelyn Whitmire", "Kyle Nakamura", "E.J. Walters", "Sarah Montgomery",
                      "Hilary Clinton", "Lindsey Sterling", "Caleb Lindon", "Courtney Cain",
                      "Christian Kama", "Jason Martin", "Britney Pears", "Nathan Vandercamp",
                      "Ricky Navarro", "Eddy Kama", "Matthew Martinez", "Deanna Blaine",
                      "Jason Stevens", "Walker Eudy", "Colin Baughn"]
    
    var ratingsArray = ["8.3", "9.9", "8.7", "8.2", "8.8",
                        "9.3", "8.3", "8.7", "9.0", "8.7",
                        "9.2", "8.0", "8.9", "8.2", "9.8",
                        "9.0", "8.1", "8.7", "8.7", "8.2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userName = namesArray[indexPath.row]
        userImg = imagesArray[indexPath.row]
        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        for count in 1...namesArray.count {
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

