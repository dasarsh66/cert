//
//  LogsViewController.swift
//  CERT
//
//  Created by Abhilash Pochampally on 2/12/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class LogsViewController: UIViewController {

    var nameLabelString = ""
    var locationLabelString = ""
    var typeLabelString = ""
    
    
    
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var locationLBL: UILabel!
    @IBOutlet weak var typeLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLBL.text = nameLabelString
        locationLBL.text = locationLabelString
        typeLBL.text = typeLabelString
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
