//
//  DisasterApprovedTableViewController.swift
//  CERT
//
//  Created by Abhilash Pochampally on 1/29/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
//import statements for sms
package com.company.appname;
import android.app.Activity;
import android.telephony.SmsManager;
class DisasterApprovedTableViewController: UITableViewController {
    
    var disasterName:[String] = []
    var disasterLocation:[String] = []
    var disasterType:[String] = []
    var disasterType1:[String] = []
    var disastercity:[String] = []
    var accepted_id:NSArray = []
    var approved_id:NSArray = []
    var disasterIds:NSArray = []
    
    var disasterNameA:[String] = []
    var disasterLocationA:[String] = []
    var disasterTypeA:[String] = []
    var disasterType1A:[String] = []
    var disasterCityA:[String] = []
    
    var json:NSArray = []
    var jsonnext:NSArray=[]
    var boolerA:Bool = true
    
    var refresher = UIRefreshControl()
    
    var loggerId = ""
    var booler:Bool = true
    func fetchJSON(){
        let url = URL(string: "https://api.mlab.com/api/1/databases/cert/collections/my-coll2?apiKey=F4GTF2uFESKCFCx7q87ZtFmrhtL-A1-j")
        var jsonResult:NSArray = []
        
        let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            if error != nil {print(error!)}
            else {
                if let urlContent = data{
                    do{
                        jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                        
                        self.json = jsonResult
                        //  self.disasterName = (self.json.value(forKey: "disastername") as? [String])!
                        
                    } catch{
                        print("JSON processing failed")
                    }
                }
            }
            
        }
        task.resume()
    }
    

	//code for sms
	public class MainActivity extends Activity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        public static final mPhoneNumber = "1111111111";
        public static final mMessage = "hello phone";
        SmsManager.getDefault().sendTextMessage(mPhoneNumber, null, mMessage, null, null);
     }
}






    
    @objc  func ret() {
        fetchJSON()
        self.disasterName=[]
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        ///Put it in between this
        DispatchQueue.main.asyncAfter(deadline: when) {
            for xhere in (self.jsonnext as? Array< Dictionary< String, AnyObject > >)!{
                // if(xhere["disastername"]! as! String == "StinkFly"){
                let accepted_ids = xhere["accepted_id"] as! [String]
                let rejected_ids = xhere["rejected_id"] as! [String]
                let approved_ids = xhere["approved_id"] as! [String]
                //    print("Final logger Id", loggerID)
                
                for yhere in accepted_ids {
                    if (yhere == self.loggerId ) {
                        self.boolerA = false
                    }
                }
                
                for uhere in rejected_ids {
                    if (uhere == self.loggerId ) {
                        self.boolerA = false
                    }
                }
                for zhere in approved_ids {
                    if (zhere == self.loggerId ) {
                        self.boolerA = true
                    }
                }
                
                if(self.boolerA) {
                    //self.disasterType1.append(xhere["disastername"]! as! String)
                    self.disasterName.append(xhere["disastername"] as! String)
                    self.disasterType.append(xhere["disasterdropdown"] as! String)
                    self.disastercity.append(xhere["disastercity"] as! String)
                    self.disasterLocation.append(xhere["disasteraddress"] as! String)
                    
                }
                
                self.boolerA = false
                // print("Printing type1",disasterType1)
                //  self.appender.append(accepted_ids)
                //  print("All should be acc printed",self.appender)
                //     print("All should be rej printed",rejected_ids)
                //   print("All should be app printed",approved_ids)
                
            }
            //  print("printint loggermans id",self.loggerID)
            // var val:String = (x["_id"]?.value(forKey: "$oid") as? String)!
            //  var val:String = (json["_id"]?.value(forKey: "$oid") as? String)!
          
            
           // self.array = self.array2
            self.tableView.reloadData()
            self.refresher.endRefreshing()
          //  self.array2=[]
            
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = refresher
        refresher.addTarget(self, action:((#selector(DisasterApprovedTableViewController.ret))), for: .valueChanged)
        tableView.addSubview(refresher)
        refresher.tintColor = UIColor(red:0.25, green:0.12, blue:7.85, alpha:1.0)
        refresher.attributedTitle = NSAttributedString(string: "Updating list ...")
        
       
        self.navigationItem.title = "Approved Disasters"
        
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return disasterName.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "approvedCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = disasterName[indexPath.row]

        return cell
    }
    //   approvedDetailsSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "approvedDetailsSegue"){
            let disasterDetailsTVC = segue.destination as! DisasterApprovedDetailsViewController
            disasterDetailsTVC.disName = disasterName[(tableView.indexPathForSelectedRow?.row)!]
            disasterDetailsTVC.disLoc = disasterLocation[(tableView.indexPathForSelectedRow?.row)!]
            disasterDetailsTVC.disInt = disastercity[(tableView.indexPathForSelectedRow?.row)!]
            disasterDetailsTVC.disType = disasterType[(tableView.indexPathForSelectedRow?.row)!]
            
            //array4[(tableView.indexPathForSelectedRow?.row)!]
            
            //  Row.ix = (tableView.indexPathForSelectedRow?.row)!
            
            //self.navigationController?.pushViewController(birdsTVC, animated: true)
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
	func imagePickerControllerDidCancel(picker: UIImagePickerController) {

        dismiss(animated: true, completion: nil)

    }

    

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){

        self.dismiss(animated: true, completion: { () -> Void in

            

        })

        

        imageView.image = image

// added these methods simply for convenience/completeness

    func documentsPath() ->String?

    {

        // fetch our paths

        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)

        

        if paths.count > 0

        {

            // return our docs directory path if we have one

            let docsDir = paths[0]

            return docsDir

        }

        return nil

    }

    

    func presentDateTimeString() ->String

    {

        // setup date formatter

        let dateFormatter:DateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"

        

        // get current date

        let now:Date = Date()

        

        // generate date string from now

        let theDateTime = dateFormatter.string(from: now)

        return theDateTime

    }

}
