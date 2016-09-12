//
//  PatientListTableViewController.swift
//  MedicalPatientApp
//
//  Created by Brant Dudgeon on 2016-09-11.
//  Copyright © 2016 thefan.ca Brant Dudgeon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct patientStruct {
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

class PatientListTableViewController: UITableViewController {
    
    var patient = [patientStruct]()
    let patientSegueIdentifier = "ViewMoreSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("PersonalData").queryOrderedByKey().observeEventType(.ChildAdded, withBlock: {
            snapshot in
           
            let lname = snapshot.value!["surname"] as! String
            let fname = snapshot.value!["givenName"] as! String
            let patStatus = snapshot.value!["status"] as! String
            let hNumber = snapshot.value!["healthCard"] as! String
            let Snumber = snapshot.value!["SIN"] as! String
            let dob = snapshot.value!["DOB"] as! String
            let blood = snapshot.value!["bloodType"] as! String
            let patSex = snapshot.value!["sex"] as! String
            let address = snapshot.value!["address"] as! String
            let addressExt = snapshot.value!["address2"] as! String
            let patCity = snapshot.value!["city"] as! String
            let prov = snapshot.value!["province"] as! String
            let postNum = snapshot.value!["postalCode"] as! String
            let homeNum = snapshot.value!["phoneH"] as! String
            let altNum = snapshot.value!["phoneA"] as! String
            let emContact = snapshot.value!["emergContact"] as! String
            let emNum = snapshot.value!["emergPhone"] as! String
            let mail = snapshot.value!["email"] as! String
            
            self.patient.insert(patientStruct(lname: lname, fname: fname, patStatus: patStatus, hNumber: hNumber, Snumber: Snumber, dob: dob, blood: blood, patSex: patSex, address: address, addressExt: addressExt, patCity: patCity, prov: prov, postNum: postNum, homeNum: homeNum, altNum: altNum, emContact: emContact, emNum: emNum, mail: mail) , atIndex: 0)
            self.tableView.reloadData()
        })
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return patient.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return patient.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")

        // Configure the cell...
        
        let surnameholder = cell?.viewWithTag(1) as! UILabel
        surnameholder.text = patient[indexPath.row].lname
        
        let firstname = cell?.viewWithTag(2) as! UILabel
        firstname.text = patient[indexPath.row].fname
        
        let discharged = cell?.viewWithTag(3) as! UILabel
        discharged.text = patient[indexPath.row].patStatus
        
        let dateholder = cell?.viewWithTag(4) as! UILabel
        dateholder.text = patient[indexPath.row].dob
        
        let female = cell?.viewWithTag(5) as! UILabel
        female.text = patient[indexPath.row].patSex
        
        let type = cell?.viewWithTag(6) as! UILabel
        type.text = patient[indexPath.row].blood
        return cell!
        
    }
    
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == patientSegueIdentifier,
            let destination = segue.destinationViewController as? PatientDetailViewController,
            patientIndex = tableView.indexPathForSelectedRow?.row
        {
         
            destination.patientAddr = patient[patientIndex].address
            destination.patientAddr2 = patient[patientIndex].addressExt
            destination.patientCity = patient[patientIndex].patCity
            destination.patientPostal = patient[patientIndex].postNum
            destination.patientProv = patient[patientIndex].prov
            destination.patientHcard = patient[patientIndex].hNumber
            destination.patientFname = patient[patientIndex].fname
            destination.patientLname = patient[patientIndex].lname
            destination.patientPhone = patient[patientIndex].homeNum
            destination.patientAphone = patient[patientIndex].altNum
        }
    }
        /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


