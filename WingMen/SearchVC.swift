//
//  SearchVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/5/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

var jobCategoryChoice: String!
var limitedWingmenArray: [Wingman] = [] // Array that stores each wingman with matching job title

class SearchVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIScrollViewDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Variables
    var img: UIImage!
    var filteredJobs: [String] = []
    var inSearchMode = false
    
    var jobsArray = ["Any Wingman", "Baby Sitter", "Graphic Designer", "Mover", "Photographer", "Tax Accounting", "Tutor"]
    let categoryImagesArray = [#imageLiteral(resourceName: "icon_wing"), #imageLiteral(resourceName: "category_babySitter"), #imageLiteral(resourceName: "category_garphicDesigner"), #imageLiteral(resourceName: "category_mover"), #imageLiteral(resourceName: "category_photography"), #imageLiteral(resourceName: "category_accounting"), #imageLiteral(resourceName: "category_tutor")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        // Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(SearchVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SearchVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // Keyboard view-moving functions
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
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
            
            filteredJobs.removeAll()
            for job in jobsArray {
                if job.lowercased().contains(lower!) && filteredJobs.contains(job) != true {
                    filteredJobs.append(job)
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
            jobCategoryChoice = filteredJobs[indexPath.row]
        } else {
            jobCategoryChoice = jobsArray[indexPath.row]
        }
        limitedWingmenArray.removeAll()
        for man in wingmenArray {
            if jobCategoryChoice == man.job || jobCategoryChoice == "Any Wingman" {
                limitedWingmenArray.append(man)
            }
        }
        performSegue(withIdentifier: "listSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "JobCategoryCell") as? CategoryCell {
            //img = imagesArray[indexPath.row]  // Caleb needs to design new images
            let job: String!
            if inSearchMode {
                job = filteredJobs[indexPath.row]
            } else {
                job = jobsArray[indexPath.row]
            }
            let image = categoryImagesArray[indexPath.row]
            cell.configureCell(job, img: image)
            return cell
        } else {
            return CategoryCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredJobs.count
        } else {
            return jobsArray.count
        }
    }
    @IBAction func backGroundTapped(_ sender: Any) {
        view.endEditing(true)
        searchBar.resignFirstResponder()
    }
}
