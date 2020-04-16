//
//  AccountManagementViewModelType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/16.
//

import Foundation

protocol AccountManagementViewModelType {
    var accountManagementView: AccountManagementViewType? {get set}
    var accountManagementRepo: AccountManagementDataSourceType? {get set}
    func login(email: String, password: String)
    func signUp(email: String, password: String)
    func signOut()
    func outcome(error: String?, isSuccessful: Bool)
}
