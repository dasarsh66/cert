//
//  ValidationManager.swift
//  CERT
//
//  Created by Abhilash Pochampally on 1/31/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
static private let regexEmail = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
static private let regexMobNo = "^[0-9]{6,15}$"
static private let regexNameType = "^[a-zA-Z]+$"
static func validateForm(signUpModel: FormValidationModel) -> ValidationError? {
    
    var validationError: ValidationError? = nil
    validationError = validateEmailId(email: signUpModel.email!)
    if validationError != nil {
        
        return validationError
    }
    
    validationError = validateNameString(string: signUpModel.name!)
    if validationError != nil {
        
        return validationError
    }
    
    validationError = validateMobileNumber(string: signUpModel.mobileNo!)
    if validationError != nil {
        
        return validationError
    }
}
