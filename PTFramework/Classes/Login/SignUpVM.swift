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
    public static func ptCreateUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to create user ", error.localizedDescription)
                return
            }
            guard let uid = result?.user.uid else { return }
            Database.database().reference().child("users").child(uid).updateChildValues(
                ["email": email], withCompletionBlock: { error, _ in
                if let error = error {
                    print("Failed to update database values with error: ", error.localizedDescription)
                    return
            }
                print("Successful Sign Up - With PTFramework")
            })
        }
    }
}
