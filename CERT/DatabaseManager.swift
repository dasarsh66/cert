//
//  DatabaseManager.swift
//  CERT
//
//  Created by student on 12/9/17.
//  Copyright © 2017 student. All rights reserved.
//

import Foundation

class DatabaseManager {
    
    
    
    func loginUser(userPassword:String) -> Bool {
        var isLoggedIn : Bool = false
        var tess:String? = nil
        var resultString = fetchData(userPassword: userPassword)
        
                print("Testing result str",resultString)
        print("testing user pASS", userPassword)
//        if resultString == userPassword {
//            return true
//                      }
//        else {
           return true
       // }
    }
    
    
    //Feteches Data from DB and convveerts to Swift Arrays
    func fetchData(userPassword:String)   {
        var passString:String=""
        var json:NSArray = []
        let url = URL(string: "https://api.mlab.com/api/1/databases/cert/collections/my-coll?apiKey=F4GTF2uFESKCFCx7q87ZtFmrhtL-A1-j")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }
            else{
                do{
                    json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! NSArray
                    
                    var result = json
                    //print(json)
                    print("-------------")
                    // print(result[0])
                    let castArray = json as? Array< Dictionary< String, AnyObject > >
                    
                    print(castArray![1])
                    //result[1]
                    OperationQueue.main.addOperation({
                        
                    })
                    
                }catch let error as NSError{
                    print(error)
                }
            }
            if let array1 = json.value(forKey: "password") as? [String] {
                //json as? [String]
              // var passwords = json.value(forKey: "password") as? [String]
                 //print("Testing array 1",passwords)
             //
               // print(passwords)
                
                //let swiftArray: [String] = array1.flatMap({ $0 as? String })
               // print(swiftArray[1])
               // self.datafrom.x=array1
                
               var datafrom:LoginViewController = LoginViewController()
               // datafrom.handleArrayOfData(data: json as! [String])
             //   datafrom.dupData = json
                
                //datafrom.handleNS(data: json)
                //  self.datafrom.handleArrayOfData(data: array1)
                
                //LoginViewController.handleArrayOfData(array1)
                for pass in array1 {
                   // print(pass)
                    if pass==userPassword {
                        // print("Testing pass pass",pass)
                        passString = pass
                        //print(passString,"Passwords Match")
                    }
                }
            }
            //tess = passString
        })
    }
    
  
    
    
    ////////////////////\\\\\\\\\\\\\
    
    func register(firstName:String, lastName:String, contact:String, address:String, city:String, state:String, zip:String, email:String, password:String, rank:String ) -> Bool {
  
    //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        let parameters = ["firstName": firstName, "lastName": lastName, "contact":contact as Any, "address":address, "city":city, "state":state, "zip":zip, "email":email, "password":password, "rank":rank, "status":0] as [String : Any]
    
    //create the url with URL
    let url = URL(string: "https://api.mlab.com/api/1/databases/cert/collections/my-coll1?apiKey=F4GTF2uFESKCFCx7q87ZtFmrhtL-A1-j")!
    //change the url
    
    //create the session object
    let session = URLSession.shared
    
    //now create the URLRequest object using the url object
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST" //set http method as POST
    
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
                print(json)
                // handle json...
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    })
    task.resume()
        return true
    }
    
}
