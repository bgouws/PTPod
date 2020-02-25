//
//  PTValidation.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/25.
//

import Foundation
public class PTValidation {
    public static func ptValidationCheck(email: String) -> Bool {
        print("PTFramework Validation Check.")
        //Email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

