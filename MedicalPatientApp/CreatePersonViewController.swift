//
//  CreatePersonViewController.swift
//  MedicalPatientApp
//
//  Created by Brant Dudgeon on 2016-09-05.
//  Copyright © 2016 thefan.ca Brant Dudgeon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct patient1Struct {
    let lname : String!
    let fname : String!
    let patStatus : String!
    let hNumber : String!
    let Snumber : String!
    let dob : String!
    let blood : String!
    let patSex : String!
    let address : String!
    let addressExt : String!
    let patCity : String!
    let prov : String!
    let postNum : String!
    let homeNum : String!
    let altNum : String!
    let emContact : String!
    let emNum : String!
    let mail : String!
    
}


class CreatePersonViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var patient = [patient1Struct]()

    @IBOutlet weak var Surname: UITextField!
    @IBOutlet weak var GivenName: UITextField!
    @IBOutlet weak var Status: UIPickerView!
    private let personsStatus = ["Active", "Discharged", "Inactived"]
    @IBOutlet weak var HealthNum: UITextField!
    @IBOutlet weak var SIN: UITextField!
    
    @IBOutlet weak var DobDD: UIPickerView!
    private let day = ["1", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    @IBOutlet weak var DobMM: UIPickerView!
    private let month = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
  
    @IBOutlet weak var DobYY: UITextField!
    @IBOutlet weak var BloodType: UIPickerView!
    private let bloodType = ["A +", "A -", "AB +", "AB -", "B +", "B -", "O +", "O -" ]
    @IBOutlet weak var Sex: UIPickerView!
    private let sexType = ["Male", "Female"]
    @IBOutlet weak var Address1: UITextField!
    @IBOutlet weak var Address2: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var Province: UIPickerView!
    private let provincesName = [
        "Alberta",
        "British Columbia",
        "Manitoba",
        "New Brunswick",
        "Newfoundland and Labrador",
        "Northwest Territories",
        "Nova Scotia",
        "Nunavut",
        "Ontario",
        "Prince Edward Island",
        "Quebec",
        "Saskatchewan",
        "Yukon"]
    @IBOutlet weak var Postal: UITextField!
    @IBOutlet weak var HPhone: UITextField!
    @IBOutlet weak var AHome: UITextField!
    @IBOutlet weak var EContact: UITextField!
    @IBOutlet weak var ENumber: UITextField!
    @IBOutlet weak var Email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Status.delegate = self
        BloodType.delegate = self
        Sex.delegate = self
        DobDD.delegate = self
        DobMM.delegate = self
        Province.delegate = self
        
       /* let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("Notes").queryOrderedByKey().observeEventType(.ChildAdded, withBlock: {
            snapshot in
            let title = snapshot.value!["title"] as! String
            let message = snapshot.value!["message"] as! String
            
            self.posts.insert(postStruct(title: title ,message: message) , atIndex: 0)
            self.tableView.reloadData()
        })*/

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createMe(){
        //Need to create checks to valid DOB, ie no 31 days in november, and length on card numbers, phone etc. and check for dupicate SIN and Health card numbers!
        let lname = Surname.text!
        let fname = GivenName.text!
        let statusRow = Status.selectedRowInComponent(0)
        let myStatus = personsStatus[statusRow]
        let patStatus = myStatus
        let hNumber = HealthNum.text!
        let Snumber = SIN.text!
        let dobDDRow = DobDD.selectedRowInComponent(0)
        let dobDD = day[dobDDRow]
        let myDay = dobDD
        let dobMMRow = DobMM.selectedRowInComponent(0)
        let dobMM = month[dobMMRow]
        let myMonth = dobMM
        let dobYYYY = DobYY.text!
        let bloodRow = BloodType.selectedRowInComponent(0)
        let myBlood = bloodType[bloodRow]
        let blood = myBlood
        let sexRow = Sex.selectedRowInComponent(0)
        let mySex = sexType[sexRow]
        let patSex = mySex
        let address = Address1.text!
        let addressExt = Address2.text!
        let patCity = City.text!
        let provRow = Province.selectedRowInComponent(0)
        let whatProv = provincesName[provRow]
        let prov = whatProv
        let postNum = Postal.text!
        let homeNum = HPhone.text!
        let altNum = AHome.text!
        let emContact = EContact.text!
        let emNum = ENumber.text!
        let mail = Email.text!
        let finalDOB = myMonth + " " + myDay + " " + dobYYYY
        
        let patient : [String : AnyObject] = ["surname" : lname, "givenName" : fname, "status" : patStatus, "healthCard" : hNumber, "SIN" : Snumber, "DOB" : finalDOB, "bYear" : dobYYYY, "bMonth" : myMonth, "bDay" : myDay, "bloodType" : blood, "sex" : patSex,
                                              "address" : address, "address2" : addressExt, "city" : patCity, "province" : prov, "postalCode" : postNum, "phoneH" : homeNum, "phoneA" : altNum,
                                              "emergContact" : emContact, "emergPhone" : emNum, "email" : mail]
        
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("PersonalData").childByAutoId().setValue(patient)
        
    }

    

    @IBAction func createPerson(sender: UIButton) {
      
     createMe()
     }
  

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)  -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == Status {
          return personsStatus.count
        }
        else if pickerView == BloodType {
            return bloodType.count
        }
        else if pickerView == Sex {
            return sexType.count
        }
        else if pickerView == DobMM {
            return month.count
        }
        else if pickerView == DobDD {
            return day.count
        }
        else {
            return provincesName.count
        }
        
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == Status {
            return personsStatus[row]
        }
        else if pickerView == BloodType {
            return bloodType[row]
        }
        else if pickerView == Sex {
            return sexType[row]
        }
        else if pickerView == DobMM {
            return month[row]
        }
        else if pickerView == DobDD {
            return day[row]
        }
        else {
            return provincesName[row]
        }
        
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
