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
    public static func ptSignUserIn(email: String, password: String) -> Bool {
        var success = true
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to sign user in with error: ", error.localizedDescription)
                success = false
            } else {
                success = true
                print("Successfully Logged user in. - With PTFramework")
            }
        }
        return success
    }
}
