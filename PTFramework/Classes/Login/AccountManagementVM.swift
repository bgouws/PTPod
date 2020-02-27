//
//  AccountManagementVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTAccountManagement {
    public static func ptCreateUser(email: String, password: String, conPassword: String) -> Bool {
        var success = false
        if PTValidation.ptValidationCheckSignUp(email: email, password: password, conPassword: conPassword) {
            if PTCreateUser.ptCreateUser(email: email, password: password) {
                success = true
            } else {
                success = false
            }
        }
        return success
    }
    public static func ptSignUserIn(email: String, password: String) -> Bool {
        var success = false
        if PTValidation.ptValidationCheckSignIn(email: email, password: password) {
            if PTSignIn.ptSignUserIn(email: email, password: password) {
                success = true
            } else {
                success = false
            }
        }
        return success
    }
}
