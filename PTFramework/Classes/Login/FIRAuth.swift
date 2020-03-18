//
//  FIRAuth.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/18.
//

import Foundation

class FIRAuth : LoginProtocol {
    private var firAuth: LoginProtocol
    
    init(firAuth: LoginProtocol) {
        self.firAuth = firAuth
    }
    func ptSignIn(email: String, password: String, completion: @escaping (Bool, String) -> ()) {
        
    }
    
    func ptSignOut() -> Bool {
        return true
    }

    func ptSignUp(email: String, password: String, conPassword: String, completion: @escaping (Bool, String) -> ()) {

    }
    
}
