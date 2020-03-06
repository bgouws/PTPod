//
//  AccountManagementVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation
import FirebaseAuth

public class PTAccountManagement {
    public init() {
    }
    public func ptSignIn(email: String, password: String, completion: @escaping (_ val: Bool) -> ()) {
        let myPTSignIn = PTSignIn()
        _ = myPTSignIn.ptSignIn(email, password) { (success) in
            print(success)
            completion(success)
        }
    }
    public func ptSignUp(email: String, password: String, conPassword: String, completion: @escaping (_ val: Bool) -> ()) {
        //var myPTValidation = PTValidation()
        //myPTValidation.ptValidationCheckSignUp(email: email, password: password, conPassword: conPassword)
         let myPTCreateUser = PTCreateUser()
        _ = myPTCreateUser.ptSignUpNow(email: email, password: password, completion: { (success) in
            print(success)
            completion(success)
        })
    }
    public func ptSignOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
}
