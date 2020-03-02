//
//  SignOutM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/02.
//

import Foundation
import FirebaseAuth

public class PTSignOut {
    public static func ptSignOutUser() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Failed to sign out with error: ", error.localizedDescription)
        }
    }
}
