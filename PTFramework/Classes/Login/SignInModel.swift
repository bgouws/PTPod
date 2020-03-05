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
    public static func ptSignIn(_ email: String, _ password: String, completion: @escaping (_ val: Bool) -> ()) {
        _ = Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in let success = (error == nil)
            completion(success)
        }
    }
}
