//
//  DisasterTableViewController.swift
//  CERT
//
//  Created by student on 11/14/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class DisasterTableViewController: UITableViewController {
    
    var disasterName:[String] = []
    var disasterLocation:[String] = []
    var disasterType:[String] = []
    var disasterType1:[String] = []
    var disastercity:[String] = []
    var accepted_id:NSArray = []
    var approved_id:NSArray = []
    var disasterIds:[String] = []
    var loggerId = ""
    var booler:Bool = true

    
  var array4 = ["Super Man","Batman", "Wonder Woman","xao"]
  var array = ["Super Man","Batman", "Wonder Woman","Green Lantern"]
  var array1 = ["x","Super Man","Batman", "Wonder Woman","Green Lantern","Rhegar targeryan"]
    
    var array2:[String] = []
   
    var tbl = UITableViewController(style: .plain)
    var json:NSArray = []
    
    var refresher = UIRefreshControl()
    
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
    
   
    
    @objc  func ret() {
     print("Check here mate", self.disasterIds)
        fetchJSON()
        self.disasterName=[]
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            
            for x in (self.json as? Array< Dictionary< String, AnyObject > >)!{
                //print("username is \(x["firstName"]!) and password is \(x["password"])")
                if((x["disastername"]! as! String != "Alexander" )){
                    /*This is for extracting ID's, i.e pulling out data remember its an array of array*/
                    
                   // var val:String = (x["_id"]?.value(forKey: "$oid") as? String)!
                    //) //Array< Dictionary< String, AnyObject > >)
                   // print("id check",val.convert?.value(forKey: "$oid")!)
                  //  print("Checking is's",val)
                    self.array2.append(x["disastername"]! as! String)

                }
            }
           // print(self.array2)
            
              //  print("username is \(x["firstName"]!) and password is \(x["password"])")
                //self.array1 = x["firstName"]! as! [String]*/
            for xhere in (self.json as? Array< Dictionary< String, AnyObject > >)!{
                // if(xhere["disastername"]! as! String == "StinkFly"){
                let accepted_ids = xhere["accepted_id"] as! [String]
                let rejected_ids = xhere["rejected_id"] as! [String]
                let approved_ids = xhere["approved_id"] as! [String]
                
                print("Final logger Id", self.loggerId)
                
                for yhere in accepted_ids {
                    if (yhere == self.loggerId ) {
                        self.booler = false
                    }
                }
                
                for uhere in rejected_ids {
                    if (uhere == self.loggerId ) {
                        self.booler = false
                    }
                }
                for zhere in approved_ids {
                    if (zhere == self.loggerId ) {
                        self.booler = false
                    }
                }
                
                if(self.booler) {
                    //self.disasterType1.append(xhere["disastername"]! as! String)
                    self.disasterName.append(xhere["disastername"] as! String)
                    self.disasterType.append(xhere["disasterdropdown"] as! String)
                    self.disastercity.append(xhere["disastercity"] as! String)
                    self.disasterLocation.append(xhere["disasteraddress"] as! String)
                    
                }
                self.booler = true
                
            }
            self.array = self.array2
            self.tableView.reloadData()
            self.refresher.endRefreshing()
            self.array2=[]
                   }
    }
    
    var x = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside It",loggerId,"Logger id")
      //  datafrom.disasterDescription.text! = "Here we send"
        tableView.refreshControl = refresher
        refresher.addTarget(self, action:((#selector(DisasterTableViewController.ret))), for: .valueChanged)
        tableView.addSubview(refresher)
        refresher.tintColor = UIColor(red:0.25, green:0.12, blue:7.85, alpha:1.0)
        refresher.attributedTitle = NSAttributedString(string: "Updating list ...")
       
        
        self.navigationItem.title = "New Disasters"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
            
    //datafrom.handleArrayOfData(data: json)
    //datafrom.dupData = json
   
    override func viewDidAppear(_ animated: Bool) {
        
    
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
        
        
        //stername") as? String)!//)
        
        
        
        return disasterName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = disasterName[indexPath.row]
    
        return cell
    }
        var xi:DisasterDetailsViewController = DisasterDetailsViewController()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetails"){
            let disasterDetailsTVC = segue.destination as! DisasterDetailsViewController
            disasterDetailsTVC.disName = disasterName[(tableView.indexPathForSelectedRow?.row)!]
            disasterDetailsTVC.disLoc = disasterLocation[(tableView.indexPathForSelectedRow?.row)!]
            disasterDetailsTVC.disInt = disastercity[(tableView.indexPathForSelectedRow?.row)!]
            disasterDetailsTVC.disType = disasterType[(tableView.indexPathForSelectedRow?.row)!]
            disasterDetailsTVC.disasterId = disasterIds[(tableView.indexPathForSelectedRow?.row)!]
            disasterDetailsTVC.loggerId = self.loggerId
            disasterDetailsTVC.accepted_id = self.accepted_id as! [String]
            
                //array4[(tableView.indexPathForSelectedRow?.row)!]
            
            //  Row.ix = (tableView.indexPathForSelectedRow?.row)!
            
            //self.navigationController?.pushViewController(birdsTVC, animated: true)
        }
    }
 
    
    
            //x=fats
    

    

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
    /*func updater(){
     
     //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
     // let pparameters = ["firstName": "firstName","lastName":"[aux, box]"] as [String : Any]
     //  data: JSON.stringify( { "$set" : { "y" : 5 } } ),
     //  data: JSON.stringify( { "x" : 2 } ),
     //
     //var ind = pparameters.index(forKey: "lastName")
     
     // print(pparameters(ind) as! String)
     print("Printing accepted IDs",accepted_id[1])
     //  accepted_id[1].insert([1,2,3,4,5], at: 0)
     //  print(accepted_id[2])
     
     
     var arr:[Int] = [1,3,5,9]
     
     //print(arr)
     disasterType1.append("Fit me if you can")
     
     //  var val = ["rejected_id":self.disasterType1]
     var val = ["disastername":"Scyther"]
     var parameters = ["$set":val]
     
     //create the url with URL
     let url = URL(string: "https://api.mlab.com/api/1/databases/cert/collections/my-coll2/5a3fd4317ae9d6267c431469?apiKey=F4GTF2uFESKCFCx7q87ZtFmrhtL-A1-j")!
     //change the url
     
     //create the session object
     let session = URLSession.shared
     
     //now create the URLRequest object using the url object
     var request = URLRequest(url: url)
     
     request.httpMethod = "PUT" //set http method as POST
     
     do
     {
     request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
     // pass dictionary to nsdata object and set it as request body
     }
     
     catch let error
     {
     print(error.localizedDescription)
     }
     
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")
     request.addValue("application/json", forHTTPHeaderField: "Accept")
     
     //create dataTask using the session object to send data to the server
     let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
     
     guard error == nil else {
     return
     }
     
     guard let data = data else {
     return
     }
     
     do {
     //create json object from data
     if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
     //   print(json)
     // handle json...
     }
     } catch let error {
     print(error.localizedDescription)
     }
     
     })
     task.resume()
     } */

}
