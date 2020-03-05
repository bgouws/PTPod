//
//  AccountManagementVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTAccountManagement {
    public static func ptSignIn(email: String, password: String, completion: @escaping (_ val: Bool) -> ()) {
        _ = PTSignIn.ptSignIn(email, password) { (success) in
            print(success)
            completion(success)
        }
    }
    public static func ptSignUp(email: String, password: String, conPassword: String, completion: @escaping (_ val: Bool) -> ()) {
        if PTValidation.ptValidationCheckSignUp(email: email, password: password, conPassword: conPassword) {
            _ = PTCreateUser.ptSignUpNow(email: email, password: password, completion: { (success) in
                print(success)
                completion(success)
            })
        }
    }
    public static func ptSignOut() {
        PTSignOut.ptSignOutUser()
    }
}
