//
//  AccountManagementVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation
import FirebaseAuth
import UIKit

public class PTAccountManagement {
    weak var view : LoginProtocol?
    init(view: LoginProtocol?) {
        self.view = view
    }
    
    public convenience init() {
        self.init(view: nil)
    }
}

extension PTAccountManagement: LoginProtocol {
    
    
    public func ptSignOut() -> Bool {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        return true
    }
    
    public func ptSignUp(email: String, password: String, conPassword: String, completion: @escaping (Bool, String) -> ()) {
        let myPTCreateUser = PTCreateUser()
        myPTCreateUser.ptSignUpNow(email: email, password: password, completion: { (success) in
           print(success)
           completion(success, "Success")
        }
    )}
    
    public func ptSignIn(email: String, password: String, completion: @escaping (Bool, String) -> ()) {
        let myPTSignIn = PTSignIn()
        _ = myPTSignIn.ptSignIn(email, password) { (success) in
            print(success)
            completion(success, "Success")
        }
    }
    
}
