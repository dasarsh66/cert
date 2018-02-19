//
//  DisasterDetailsViewController.swift
//  CERT
//
//  Created by Abhilash Pochampally on 1/28/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class DisasterDetailsViewController: UIViewController {
    
    
    var dis:DisasterTableViewController=DisasterTableViewController()
   /// var fatso:DisasterDetailsViewController=DisasterDetailsViewController()
    
    @IBOutlet weak var disasterType: UILabel!
    @IBOutlet weak var disasterIntensity: UILabel!
    @IBOutlet weak var disasterLocation: UILabel!
    @IBOutlet weak var disasterDescription: UITextView!
    
    var disName = ""
    var disType = ""
    var disInt = ""
    var disLoc = ""
    var loggerId:String = ""
    var disasterType1:[String] = []
    var accepted_id:[String] = []
    var disasterId = ""
    
    @IBAction func disasterAccept(_ sender: Any) {
        updater(buttonPressValue: "accepted_id")
     
    }
    @IBAction func disasterReject(_ sender: Any) {
        updater(buttonPressValue: "rejected_id")
    }
    
    
    func updater(buttonPressValue:String){
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
         let pparameters = ["firstName": "firstName","lastName":"[aux, box]"] as [String : Any]
          data: JSON.stringify( { "$set" : { "y" : 5 } } ),
          data: JSON.stringify( { "x" : 2 } ),
        
        var ind = pparameters.index(forKey: "lastName")
        
         print(pparameters(ind) as! String)
        print("Printing accepted IDs",accepted_id[1])
          accepted_id[1].insert([1,2,3,4,5], at: 0)
         print(accepted_id[2])
        
        
        //var buttonPressValue = buttonPressValue
        var arr:[Int] = [1,3,5,9]
        
        //print(arr)
        disasterType1.append("Fit me if you can")
        var loggersID:[String] = []
        loggersID.append(self.loggerId)
        //  var val = ["rejected_id":self.disasterType1]
        var val = [buttonPressValue:loggersID]
        var parameters = ["$set":val]
        
        //create the url with URL
        var sk = self.disasterId
        let url = URL(string: "https://api.mlab.com/api/1/databases/cert/collections/my-coll2/\(sk)?apiKey=F4GTF2uFESKCFCx7q87ZtFmrhtL-A1-j")!
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
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = disName
        disasterType.text = disType as! String
        disasterIntensity.text = disInt as! String
        disasterLocation.text = disLoc as! String
        print("Check here mate",self.loggerId)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
