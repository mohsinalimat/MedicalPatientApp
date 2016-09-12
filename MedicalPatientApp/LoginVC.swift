//
//  LoginVC.swift
//  MedicalPatientApp
//
//  Created by Brant Dudgeon on 2016-09-01.
//  Copyright © 2016 thefan.ca Brant Dudgeon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignUp(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_signup", sender: self)
    }
    
    @IBAction func signIN(sender: UIButton) {
    login()
    }
  

    func login() {
        
        FIRAuth.auth()?.signInWithEmail(email.text!, password: password.text!, completion: {
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
                
                self.performSegueWithIdentifier("goto_whoami", sender: self)
                
                
                
            }
        })
    }

    
}
