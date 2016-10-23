//
//  RecentListingsVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/21/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

class RecentListingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var recentJobsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        recentJobsArray = ["Photographer", "Tutor", "Graphic Designer", "Tutor", "Mover"]
    }
    
    // Table view functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listingCell") as? RecentJobCell {
            cell.configureCell(#imageLiteral(resourceName: "profile2"), nameTxt: "Kyle Nakamura", jobTxt: "Photographer Needed", locationTxt: "Azusa, CA", hoursAgo: 2)
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
