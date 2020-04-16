//
//  AccountManagementModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/15.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

public class AccountManagementModel: AccountManagementDataSourceType {
    public func signOut(_ completion: @escaping (String?, Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil, true)
        } catch let error {
            print("Failed to sign out with error: ", error.localizedDescription)
            completion(error.localizedDescription, false)
        }
    }
    public init() {
    }
    public func login(email: String, password: String, _ completion: @escaping (String?, Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(error.localizedDescription, false)
            } else {
                completion(nil, true)
            }
        }
    }
    public func signUp(email: String, password: String, _ completion: @escaping (String?, Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(error.localizedDescription, false)
            } else {
                completion(nil, true)
            }
        }
    }
}
