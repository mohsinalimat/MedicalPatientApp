//
//  PatientDetailViewController.swift
//  MedicalPatientApp
//
//  Created by Brant Dudgeon on 2016-09-11.
//  Copyright © 2016 thefan.ca Brant Dudgeon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PatientDetailViewController: UIViewController {
    
    @IBOutlet weak var detailAddress: UILabel!
    @IBOutlet weak var detailaddress2: UILabel!
    @IBOutlet weak var detailCity: UILabel!
    @IBOutlet weak var detailPostal: UILabel!
    @IBOutlet weak var detailProv: UILabel!
    @IBOutlet weak var detailHcard: UILabel!
   
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailFname: UILabel!
    @IBOutlet weak var detailLname: UILabel!
    
    @IBOutlet weak var detailHphone: UILabel!
    @IBOutlet weak var detailAphone: UILabel!
    
    var patientAddr = String()
    var patientAddr2 = String()
    var patientCity = String()
    var patientPostal = String()
    var patientProv = String()
    var patientHcard = String()
    var patientFname = String()
    var patientLname = String()
    var patientPhone = String()
    var patientAphone = String()
    
    
    override func viewWillAppear(animated: Bool) {
        detailAddress.text = patientAddr
        detailaddress2.text = patientAddr2
        detailCity.text = patientCity
        detailPostal.text = patientPostal
        detailProv.text = patientProv
        detailHcard.text = patientHcard
        detailFname.text = patientFname
        detailLname.text = patientLname
        detailHphone.text = patientPhone
        detailAphone.text = patientAphone
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
