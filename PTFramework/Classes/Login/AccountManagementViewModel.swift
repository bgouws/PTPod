//
//  AccountManagementVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation
import FirebaseAuth
import UIKit

public class PTAccountManagement {
    public init() {
    }
    public func ptSignOut() -> Bool {
        let mySignOut = PTSignOut()
        mySignOut.ptSignOutUser()
        return true
    }
    public func ptSignUp(email: String, password: String, conPassword: String,
                         completion: @escaping (Bool, String) -> Void) {
        let myPTCreateUser = PTCreateUser()
        myPTCreateUser.ptSignUpNow(email: email, password: password, completion: { (success) in
           print(success)
           completion(success, "Success")
        }
    )}
    public func ptSignIn(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        let myPTSignIn = PTSignIn()
        _ = myPTSignIn.ptSignIn(email, password) { (success) in
            print(success)
            completion(success, "Success")
        }
    }
    public func getUID() -> String {
        let user = Auth.auth().currentUser?.uid
        return user ?? "Nothing here"
    }
}
