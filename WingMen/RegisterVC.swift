//
//  RegisterVC.swift
//  WingMen
//
//  Created by Kyle Nakamura on 11/17/16.
//  Copyright © 2016 Kyle Nakamura. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegisterVC: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfirmField: UITextField!
    
    // Variables
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.delegate = self
        passwordConfirmField.delegate = self
        
        // Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
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
    
    // Jump from usernameField to passwordField to passwordConfirm then hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            passwordConfirmField.becomeFirstResponder()
        } else {
            passwordField.resignFirstResponder()
        }
        return true
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @IBAction func onRegisterPress(_ sender: Any) {
        pressedRegisterButton()
    }
    
    func pressedRegisterButton() {
        if passwordField.text == passwordConfirmField.text {
            // Firebase Auth registration
            if let em = usernameField.text, let pass = passwordField.text {
                FIRAuth.auth()?.createUser(withEmail: usernameField.text!, password: passwordField.text!) {(user, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    else {
                        print("User signed in!")
                        //                    self.ref.child("data/users").updateChildValues(["\(FIRAuth.auth()!.currentUser!.uid)":["Username":self.usernameField.text]])
                    }
                }
            }
            else{
                print("You left email/password empty.")
            }
        } else {
            print("Your password does not match.")
        }
        
        if isValidEmail(testStr: usernameField.text!) == true {
            performSegue(withIdentifier: "registerSignInSegue", sender: self)
        } else {
            print("Please enter a valid email address.")
        }
    }
}
