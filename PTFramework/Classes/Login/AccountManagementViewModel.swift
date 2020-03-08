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
    
    public func ptSignOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
}

extension PTAccountManagement: LoginProtocol {
    public func ptSignUp(email: String, password: String, conPassword: String, completion: @escaping (Bool, _ String: Any?) -> ()) {
         let myPTCreateUser = PTCreateUser()
         myPTCreateUser.ptSignUpNow(email: email, password: password, completion: { (success) in
            print(success)
            completion(success, "Success")
        })
    }
}
