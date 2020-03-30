//
//  LoginProtocol.swift
//  Play Time
//
//  Created by Brandon Gouws on 2020/03/08.
//  Copyright © 2020 Brandon Gouws. All rights reserved.
//

import Foundation

protocol LoginProtocol: class {
    func ptSignUp(email: String, password: String, conPassword: String,
                  completion: @escaping (Bool, _ String: String) -> Void)
    func ptSignIn(email: String, password: String, completion: @escaping (Bool, _ String: String) -> Void)
    func ptSignOut() -> Bool
}
