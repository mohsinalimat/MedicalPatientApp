//
//  SignupVC.swift
//  MedicalPatientApp
//
//  Created by Brant Dudgeon on 2016-09-01.
//  Copyright © 2016 thefan.ca Brant Dudgeon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupVC: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var password2: UITextField!
    
    
    
    @IBAction func SignUp(sender: UIButton) {
    
    if password.text == password2.text {
    
    
        FIRAuth.auth()?.createUserWithEmail(username.text!, password: password.text!, completion: {
                user, error in
    
                if error != nil{
    
                    let alert2 = UIAlertController(title: "Error", message: "User already exists OR  invalid entry", preferredStyle: .Alert)
                    let failAction = UIAlertAction(title: "OK", style: .Default) { (alert2: UIAlertAction!) -> Void in
                        NSLog("Login Error, Acknowledged")
                    }
                    
                    
                    alert2.addAction(failAction)
                    self.presentViewController(alert2, animated: true, completion:nil)
                    
    
                }
                else{
                    self.login()
                    
                }
    
               })
        

      }
    
      else{
        let alert1 = UIAlertController(title: "Passwords Do Not Match", message: "Please reenter your password.", preferredStyle: .Alert)
        let otherAction = UIAlertAction(title: "OK", style: .Default) { (alert1: UIAlertAction!) -> Void in
            NSLog("Login Error, Acknowledged")
        }
        
        
        alert1.addAction(otherAction)
        self.presentViewController(alert1, animated: true, completion:nil)

    
      }
    }
    
    func login() {
        
        FIRAuth.auth()?.signInWithEmail(username.text!, password: password.text!, completion: {
            user, error in
            if error != nil{
                
                let alert = UIAlertController(title: "Missing Credentials Or Error", message: "Please reenter your credentials. If creating a using, check user name or password length.", preferredStyle: .Alert)
                let firstAction = UIAlertAction(title: "OK", style: .Default) { (alert: UIAlertAction!) -> Void in
                    NSLog("Login Error, Acknowledged")
                }
                
                
                alert.addAction(firstAction)
                self.presentViewController(alert, animated: true, completion:nil)
                
            }
            else  {
                
                self.performSegueWithIdentifier("WhoAmISignUp", sender: self)
                
                
                
            }
        })
    }

    @IBAction func SignMeIn(sender: UIButton) {
        self.performSegueWithIdentifier("goto_signin", sender: self)
    }
}
