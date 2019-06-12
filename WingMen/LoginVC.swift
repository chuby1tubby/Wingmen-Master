//
//  LoginVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 10/10/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging
import FirebaseInstanceID
import FirebaseDatabase
import FirebaseAuth

// Global Variables
var isSignedInAsWingman: Bool = false

class LoginVC: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // Variables
    var ref: FIRDatabaseReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firebase setup
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news/")
        ref = FIRDatabase.database().reference()
        
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
    
    func isValidSyntax(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // Actions
    @IBAction func onSignInPressed(_ sender: Any) {
        var isValidLogin: Bool = false
        if isValidSyntax(testStr: usernameField.text!) == true {
            FIRAuth.auth()?.signIn(withEmail: usernameField.text!, password: passwordField.text!) { (user, error) in
                isValidLogin = true
                print("Login Successful!")
                self.performMySignInSegue()
            }
        } else {
            print("Please enter a valid email address.")
        }
    }
    
    func performMySignInSegue() {
        performSegue(withIdentifier: "regularSignInSegue", sender: self)
    }
    
    @IBAction func onBackgroundTapped(_ sender: Any) {
        view.endEditing(true)
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
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
