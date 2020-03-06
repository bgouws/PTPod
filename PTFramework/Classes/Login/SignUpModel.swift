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
    public func ptSignUpNow(email: String, password: String, completion: @escaping (_ val: Bool) -> ()) {
        _ = Auth.auth().createUser(withEmail:  email, password: password) {
        (result, error) in let success = (error == nil)
        completion(success)
        }
    }
}
