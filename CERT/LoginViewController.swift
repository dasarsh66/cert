//
//  LoginViewController.swift
//  CERT
//
//  Created by student on 11/14/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var databaseManagerInstance:DatabaseManager = DatabaseManager()
    var xa:Bool?
    var dupData:NSArray?
    var json:NSArray = []
    var booler:Bool = true
    var boolerA:Bool = true
    var loggerID=""
    
    var authenticateBooler = false
    var disasterIds :[String] = []
    
    var jsonnext:NSArray=[]
    var disasterName:[String] = []
    var disasterLocation:[String] = []
    var disasterType:[String] = []
    var disasterType1:[String] = []
    var disasterCity:[String] = []
    var accepted_id:NSArray = []
    var approved_id:NSArray = []
    var appender:[[Int]] = []
    
    
    
    
    
    var disasterNameA:[String] = []
    var disasterLocationA:[String] = []
    var disasterTypeA:[String] = []
    var disasterType1A:[String] = []
    var disasterCityA:[String] = []
    
    
    
    
   
    @IBOutlet weak var LoginContact: UITextField!
    @IBOutlet weak var LoginPassword: UITextField!
    @IBAction func LoginLogin(_ sender: Any) {
        
        fetchJSON()
        fetchJSON1()
        
        let when = DispatchTime.now() + 4 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
        //print("count of json \(self.json[0])")
            //self.json.

            //var shouldSegue =
                            self.authenticate(username: self.LoginContact.text!, password: self.LoginPassword.text!)
            print("Top level loggers",self.loggerID)
            if self.authenticateBooler{
                self.addData()
                self.sendapprovedData()
           // if shouldSegue{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                let alertController = UIAlertController(title: "Message", message: "Failed", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            
//            var temp = self.json as? Array< Dictionary< String, AnyObject > >
//          //  print(temp as Any)
//           // print(temp![2])
//            if let array1 = self.json.value(forKey: "password") as? [String] {
//               // print(array1)
//                var count:Int = 0
//                for x in array1 {
//                    count+=1
//                    print(x)
//
//                    if x == self.LoginPassword.text!{
//                        //x=4
//
//                        self.xa=true
//                         self.performSegue(withIdentifier: "loginSegue", sender: self)
//                    }
//                }
                /*  for keyWord in array1 {
                 if keyWord == LoginPassword.text!
                 {
                 x = true
                 
                 }
                 else{
                 x = false
                 }*/
//            }
        }
        
         //   print("Printing x in LV",x)
//        if shouldPerformSegue(withIdentifier: "loginSegue", sender: self) {
//        }
//        else {
//            let alertController = UIAlertController(title: "Message", message: "Failed", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
//            self.present(alertController, animated: true, completion: nil)
//        }
        //self.performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
  
    func fetchJSON(){
        
        let url = URL(string: "https://api.mlab.com/api/1/databases/cert/collections/my-coll1?apiKey=F4GTF2uFESKCFCx7q87ZtFmrhtL-A1-j")
        var jsonResult:NSArray = []
        let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            if error != nil {print(error!)}
            else {
                if let urlContent = data{
                    do{
                        jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                        //print(jsonResult)
//                        DispatchQueue.main.async {
//                            self.sunsignLBL.text = "\(jsonResult["sunsign"]!!)"
//                            self.dateLBL.text = "\(jsonResult["date"]!!)"
                            self.json = jsonResult
//                            self.sunsignImage.image = zodiacImage
//                            self.horoscopeTF.text = "\(jsonResult["horoscope"]!!)"
//                        }
                    } catch{
                        print("JSON processing failed")
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchJSON1(){
        let url = URL(string: "https://api.mlab.com/api/1/databases/cert/collections/my-coll2?apiKey=F4GTF2uFESKCFCx7q87ZtFmrhtL-A1-j")
        var jsonResult:NSArray = []
        
        let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            if error != nil {print(error!)}
            else {
                if let urlContent = data{
                    do{
                        jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                        
                        self.jsonnext = jsonResult
                       // print(self.jsonnext)
                    
                       /* self.disasterName = (self.jsonnext.value(forKey: "disastername") as? [String])!
                        self.disasterLocation = (self.jsonnext.value(forKey: "disasteraddress") as? [String])!
                        self.disasterType = (self.jsonnext.value(forKey: "disasterdropdown") as? [String])!
                        self.disasterCity = (self.jsonnext.value(forKey: "disastercity") as? [String])!
                        self.accepted_id = (self.jsonnext.value(forKey: "accepted_id") as? NSArray)!
                        self.approved_id = (self.jsonnext.value(forKey: "approved_id") as? NSArray)! */
                    } catch{
                        print("JSON processing failed")
                    }
                }
            }
            
        }
        task.resume()
    }
    
    //        var json:NSArray = []
    //        let url = URL(string: "https://api.mlab.com/api/1/databases/cert/collections/my-coll?apiKey=F4GTF2uFESKCFCx7q87ZtFmrhtL-A1-j")
    //        URLSession.shared.dataTask(with: url!, completionHandler: {
    //            (data, response, error) in
    //            if(error != nil){
    //                print("error")
    //            }
    //            else{
    //                do{
    //                    json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! NSArray
    ////
    ////                    var result = json
    //                     // print(json)
    ////                    print("-------------")
    ////                    // print(result[0])
    ////                    let castArray = json as? Array< Dictionary< String, AnyObject > >
    ////                    print(castArray![1])
    ////                    //result[1]
    ////                    OperationQueue.main.addOperation({
    ////
    ////                    })
    //
    //                }catch let error as NSError{
    //                    print(error)
    //                }
    //            }
    //    }).resume()
    
    
    
    /*To send filter acceptes, approved and rejected id's*/
 
    func addData(){
        
     //   print("printint loggermans id",self.loggerID)
        // var val:String = (x["_id"]?.value(forKey: "$oid") as? String)!
        //  var val:String = (json["_id"]?.value(forKey: "$oid") as? String)!
        for xhere in (self.jsonnext as? Array< Dictionary< String, AnyObject > >)!{
            // if(xhere["disastername"]! as! String == "StinkFly"){
            let accepted_ids = xhere["accepted_id"] as! [String]
            let rejected_ids = xhere["rejected_id"] as! [String]
            let approved_ids = xhere["approved_id"] as! [String]
           print("logger ids before for loop®", loggerID)
          
            for yhere in accepted_ids {
                if (yhere == loggerID ) {
                    self.booler = false
                }
               
            }
            
            for uhere in rejected_ids {
                if (uhere == loggerID ) {
                    self.booler = false
                }

            }
            for zhere in approved_ids {
                if (zhere == loggerID ) {
                    self.booler = false
                }
            
            }
            print("printing booler number 1", self.booler)
            if(self.booler == true) {
                //self.disasterType1.append(xhere["disastername"]! as! String)
                self.disasterName.append(xhere["disastername"] as! String)
                self.disasterType.append(xhere["disasterdropdown"] as! String)
                self.disasterCity.append(xhere["disastercity"] as! String)
                self.disasterLocation.append(xhere["disasteraddress"] as! String)
                self.disasterIds.append((xhere["_id"]?.value(forKey: "$oid") as? String)!)
            }
            
            self.booler = true
          // print("check here mate",self.disasterIds)
            
            // print("Printing type1",disasterType1)
          //  self.appender.append(accepted_ids)
                     //   print("All should be acc printed",self.appender)
       //     print("All should be rej printed",rejected_ids)
        //    print("All should be app printed",approved_ids)
            
        }
    }
    func sendapprovedData(){
        
      //  print("printint loggermans id",self.loggerID)
        // var val:String = (x["_id"]?.value(forKey: "$oid") as? String)!
        //  var val:String = (json["_id"]?.value(forKey: "$oid") as? String)!
        for xhere in (self.jsonnext as? Array< Dictionary< String, AnyObject > >)!{
            // if(xhere["disastername"]! as! String == "StinkFly"){
            let accepted_ids = xhere["accepted_id"] as! [String]
            let rejected_ids = xhere["rejected_id"] as! [String]
            let approved_ids = xhere["approved_id"] as! [String]
        //    print("Final logger Id", loggerID)
            
            for yhere in accepted_ids {
                if (yhere == loggerID ) {
                    self.boolerA = false
                }
            }
            
            for uhere in rejected_ids {
                if (uhere == loggerID ) {
                    self.boolerA = false
                }
            }
            for zhere in approved_ids {
                if (zhere == loggerID ) {
                    self.boolerA = true
                }
            }
            
            if(self.boolerA) {
                //self.disasterType1.append(xhere["disastername"]! as! String)
                self.disasterNameA.append(xhere["disastername"] as! String)
                self.disasterTypeA.append(xhere["disasterdropdown"] as! String)
                self.disasterCityA.append(xhere["disastercity"] as! String)
                self.disasterLocationA.append(xhere["disasteraddress"] as! String)
                
            }
            
            self.boolerA = false
           // print("Printing type1",disasterType1)
            //  self.appender.append(accepted_ids)
          //  print("All should be acc printed",self.appender)
            //     print("All should be rej printed",rejected_ids)
         //   print("All should be app printed",approved_ids)
            
        }
    }

    
    /*To authenticate */
    
    func authenticate(username: String, password: String){
        for x in (self.json as? Array< Dictionary< String, AnyObject > >)!{
            //print("username is \(x["firstName"]!) and password is \(x["password"])")
            if(x["firstName"]! as! String == username && x["password"]! as! String == password){
             //   print(x)
              
                loggerID = (x["_id"]?.value(forKey: "$oid") as? String)!//) //Array< Dictionary< String, AnyObject > >)
               
                // print("id check",convert?.value(forKey: "$oid")!)
               // print("Printing loggerID here",loggerID)
                    self.authenticateBooler = true
                    break
                //return true
            }
        }
        //return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "loginSegue"){
            let tabCtrl = segue.destination as! UITabBarController
            let destinationVC = tabCtrl.viewControllers![0] as! DisasterTableViewController // Assuming home view controller is in the first tab, else update the array index
            destinationVC.accepted_id = self.accepted_id  as NSArray
            destinationVC.approved_id = self.approved_id  as NSArray
            destinationVC.loggerId = self.loggerID;
            destinationVC.disasterName = self.disasterName
            destinationVC.disastercity = self.disasterCity
            destinationVC.disasterType = self.disasterType
            destinationVC.disasterLocation = self.disasterLocation
            destinationVC.disasterType1 = self.disasterType1
            destinationVC.disasterIds = self.disasterIds 
            
            let tabCtrl2 = segue.destination as! UITabBarController
            let approvedDestinationVC = tabCtrl.viewControllers![1] as! DisasterApprovedTableViewController // Assuming home view controller is in the first tab, else update the array index
           // approvedDestinationVC.accepted_id = self.accepted_id  as NSArray
            //approvedDestinationVC.approved_id = self.approved_id  as NSArray
            
            approvedDestinationVC.loggerId = self.loggerID;
            approvedDestinationVC.disasterName = self.disasterNameA
            approvedDestinationVC.disastercity = self.disasterCityA
            approvedDestinationVC.disasterType = self.disasterTypeA
            approvedDestinationVC.disasterLocation = self.disasterLocationA
            approvedDestinationVC.disasterType1 = self.disasterType1
            
        
        }
    }
    
    
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//
//        if identifier == "loginSegue" {
//            //Returns true if credentials matches with credentials in DB
//
//            return true
//            //databaseManagerInstance.loginUser(userPassword: LoginPassword.text!)
//        }
//        else if identifier == "registerationSegue"{
//            return true
//        }
//        else if identifier == "forgotPassSegue" {
//            return true
//        }
//        else {
//            return true
//        }
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
     

       // handleNS(data: dupData!)
       // databaseManagerInstance.fetchData(userPassword: LoginPassword.text!)
        // Do any additional setup after loading the view.
       // var here = databaseManagerInstance
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
    func handleNS(data: NSArray)  {
        if let array1 = data.value(forKey: "password") as? [String] {
            print(array1)
          /*  for keyWord in array1 {
                if keyWord == LoginPassword.text!
                {
                    x = true
                    
                }
                else{
                    x = false
                }*/
            }
        }
    
    
    func handleArrayOfData(data:[String]){
      //  print("Printing data",data)
        
    }
}
