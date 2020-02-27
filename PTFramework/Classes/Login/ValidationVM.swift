//
//  ValidationVM.swift
//  Pods
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTValidation {
    public static func ptValidationCheckSignIn(email: String, password: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if (emailPred.evaluate(with: email) && password != "") {
            print("Passed Validation")
            return true
        }
        print("Failed Validation")
        return false
    }
    public static func ptValidationCheckSignUp(email: String, password: String, conPassword: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if (emailPred.evaluate(with: email) && password != "" && password == conPassword) {
            return true
        }
        return false
    }
}
