//
//  SignUp.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public class PTCreateUser {
    public func ptSignUpNow(email: String, password: String, completion: @escaping (_ val: Bool) -> Void) {
        let myValidation = Valid()
        if myValidation.signUpValidation(email, password, password) {
            _ = Auth.auth().createUser(withEmail:  email, password: password) { (_, error) in
            let success = (error == nil)
            completion(success)
            }
        } else {
            let validationFailure = false
            completion(validationFailure)
        }
    }
}
