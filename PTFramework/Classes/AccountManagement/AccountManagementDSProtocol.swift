//
//  AccountManagementDSProtocol.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/15.
//

import Foundation

public protocol AccountManagementDSProtocol: class {
    func login(email: String, password: String, _ completion: @escaping (_ error: String?, _ signedIn: Bool) -> Void)
    func signUp(email: String, password: String, _ completion: @escaping (_ error: String?,
                                                                          _ accountCreated: Bool) -> Void)
    func signOut(_ completion: @escaping (String?, Bool) -> Void)
}
