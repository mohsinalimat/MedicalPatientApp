//
//  Welcome.swift
//  MedicalPatientApp
//
//  Created by Brant Dudgeon on 2016-09-01.
//  Copyright © 2016 thefan.ca Brant Dudgeon. All rights reserved.
//

import UIKit
import Firebase

class Welcome: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
       @IBAction func gotoLogin(sender: AnyObject) {
        
        
       self.performSegueWithIdentifier("goto_login", sender: self)
        
    }
    

}
