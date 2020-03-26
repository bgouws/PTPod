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
    public func ptSignIn(_ email: String, _ password: String, completion: @escaping (_ val: Bool) -> ()) {
        let myValidation = Valid()
        let myProfile = ProfileModel()
        if myValidation.sign(inValidation: email, password) {
            _ = Auth.auth().signIn(withEmail: email, password: password) {
                (result, error) in let success = (error == nil)
                completion(success)
                myProfile.readData { (firstName, lastName, bio) in
                    print("First Name: \(firstName)")
                    print("Last Name: \(lastName)")
                    print("Bio: \(bio)")
                }
            }
        } else {
            let validationFailure = false
            completion(validationFailure)
        }
    }
}
