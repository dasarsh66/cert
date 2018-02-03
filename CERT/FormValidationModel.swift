//
//  FormValidationModel.swift
//  CERT
//
//  Created by Abhilash Pochampally on 1/31/18.
//  Copyright © 2018 student. All rights reserved.
//

struct FormValidationModel {
    
    // MARK:- VARIABLES
    var email: String?
    var name: String?
    var mobileNo: String?
    
    //MARK:- CONSTRUCTORS
    
    init(userEmail: String?, userName: String, mobile: String) {
        
        email = userEmail
        name = userName
        mobileNo = mobile
    }
}
