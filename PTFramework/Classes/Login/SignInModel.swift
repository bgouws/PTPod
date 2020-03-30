//
//  SignIn.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

public class PTSignIn {
    public func ptSignIn(_ email: String, _ password: String, completion: @escaping (_ val: Bool) -> Void) {
        let myValidation = Valid()
        if myValidation.sign(inValidation: email, password) {
            _ = Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
                let success = (error == nil)
                completion(success)
            }
        } else {
            let validationFailure = false
            completion(validationFailure)
        }
    }
}
