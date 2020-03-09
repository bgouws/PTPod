//
//  ValidationVM.swift
//  Pods
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTValidation {
    public func ptValidationCheckSignIn(email: String, password: String) -> Bool {
        var flag = false
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if (emailPred.evaluate(with: email) && password != "") {
            print("Passed Validation")
            flag = true
        } else {
            print("Failed Validation")
            flag = false
        }
        return flag
    }
    public func ptValidationCheckSignUp(email: String, password: String, conPassword: String) -> Bool {
        var flag =  false
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if (emailPred.evaluate(with: email) && password != "" && password == conPassword) {
            flag =  true
        } else {
            flag = false
        }
        return flag
    }
}
