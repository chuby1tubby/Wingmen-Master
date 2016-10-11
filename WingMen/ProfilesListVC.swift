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
    
    var imagesArray = [#imageLiteral(resourceName: "kyleImage"), #imageLiteral(resourceName: "kamaImage"), #imageLiteral(resourceName: "calebImage"), #imageLiteral(resourceName: "eudyImage"), #imageLiteral(resourceName: "baugnImage")]
    var namesArray = ["Kyle Nakamura", "Christian Kama", "Caleb Linden", "Walker Eudy", "Collin Baughn"]
    var jobsArray = ["Photographer", "Personal Trainer", "Graphic Designer", "Military Combatant", "Military Training"]
    var locationsArray = ["Azusa, CA", "Azusa, CA", "Azusa, CA", "S. Korea", "S. Korea"]
    var ratingsArray = ["9.9", "8.3", "8.7", "8.2", "8.8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell") as? ProfileCell {
            
            img = imagesArray[indexPath.row]
            name = namesArray[indexPath.row]
            //job = jobsArray[indexPath.row]
            location = locationsArray[indexPath.row]
            rating = ratingsArray[indexPath.row]
            
            switch jobCategoryChoice {
            case "Photographers":
                job = "Photographer"
            case "Personal Trainers":
                job = "Personal Trainer"
            case "Graphic Designers":
                job = "Graphic Designer"
            case "Military Combatants":
                job = "Military Combatant"
            case "Military Trainers":
                job = "Military Trainer"
            default:
                job = "Error"
            }
            
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

