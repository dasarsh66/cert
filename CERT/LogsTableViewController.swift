//
//  LogsTableViewController.swift
//  CERT
//
//  Created by Abhilash Pochampally on 2/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class LogsTableViewController: UITableViewController {

    
    var acceptedDisastersNames:[String] = []
    var acceptedDisastersLocations:[String]=[]
    var acceptedDisastersIntensities:[String]=[]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In logs vc",self.acceptedDisastersIntensities[0])
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return acceptedDisastersNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "acceptedCells", for: indexPath)
        
        cell.textLabel?.text = acceptedDisastersNames[indexPath.row]
		cell2.textLabel?.text = rejecteddDisastersNames[indexPath.row]
        // Configure the cell...

        return cell
    }
 

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logsSegue" {
            let logsDetails = segue.destination as? LogsViewController
            
            // logsDetails?.locationLBL.text = "nhhh"
            //self.acceptedDisastersLocations[(tableView.indexPathForSelectedRow?.row)!]
            logsDetails?.nameLabelString = self.acceptedDisastersNames[tableView.indexPathForSelectedRow!.row]
            logsDetails?.typeLabelString = self.acceptedDisastersLocations[tableView.indexPathForSelectedRow!.row]
            logsDetails?.locationLabelString = self.acceptedDisastersIntensities[tableView.indexPathForSelectedRow!.row]
        }
		
		
		
		
		
		
		
    }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
