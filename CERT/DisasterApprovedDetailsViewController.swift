//
//  DisasterApprovedDetailsViewController.swift
//  CERT
//
//  Created by Abhilash Pochampally on 1/29/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class DisasterApprovedDetailsViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    
    @IBOutlet weak var disasterType: UILabel!
    @IBOutlet weak var disasterIntensity: UILabel!
    @IBOutlet weak var disasterLoc: UILabel!
    var loggerId:String = ""
    
    var disName = ""
    var disType = ""
    var disInt = ""
    var disLoc = ""
   
    @IBAction func openCameraButton(sender: AnyObject) {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera;
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    imagePicked.image = image 
    dismiss(animated:true, completion: nil)
}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = disName
        disasterType.text = disType
        disasterIntensity.text = disInt
        disasterLoc.text = disLoc
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
