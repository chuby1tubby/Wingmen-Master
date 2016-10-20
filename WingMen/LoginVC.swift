//
//  LoginVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/10/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit

// Global Variables
var isSignedInAsWingman: Bool = false

class LoginVC: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // Variables

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameField.delegate = self
        passwordField.delegate = self
        
        // Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

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
    
    // Jump from usernameField to passwordField, then hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            passwordField.becomeFirstResponder()
        } else {
            passwordField.resignFirstResponder()
        }
        return true
    }
    
    
    // Actions
    @IBAction func onSignInPressed(_ sender: Any) {
        if (usernameField.text?.lowercased().contains("wingmenllc"))! {
            // Do Wingman segue
            performSegue(withIdentifier: "wingmenSignInSegue", sender: self)
            isSignedInAsWingman = true
        } else {
            // Do Regular segue
            performSegue(withIdentifier: "regularSignInSegue", sender: self)
            isSignedInAsWingman = false
        }
    }
    @IBAction func facebookRecognizer(_ sender: AnyObject) {
        socialMediaSelection = "Facebook Login Screen"
        performSegue(withIdentifier: "mediaSegue", sender: self)
    }
    @IBAction func twitterRecognizer(_ sender: AnyObject) {
        socialMediaSelection = "Twitter Login Screen"
        performSegue(withIdentifier: "mediaSegue", sender: self)
    }
    @IBAction func googleRecognizer(_ sender: AnyObject) {
        socialMediaSelection = "Google Login Screen"
        performSegue(withIdentifier: "mediaSegue", sender: self)
    }
}
