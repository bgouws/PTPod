//
//  AccountManagementViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/15.
//

import Foundation

public class AccountManagementViewModel : AccountManagementViewModelType {
    public weak var accountManagementView: AccountManagementViewType?
    public var accountManagementRepo: AccountManagementDataSourceType?
    public init() {
    }
    public func login(email: String, password: String) {
        accountManagementRepo?.login(email: email, password: password, { (error, signedIn) in
            self.outcome(error: error, isSuccessful: signedIn)
        })
    }
    public func signUp(email: String, password: String) {
        accountManagementRepo?.signUp(email: email, password: password, { (error, accountCreated) in
            self.outcome(error: error, isSuccessful: accountCreated)
        })
    }
    public func signOut() {
        accountManagementRepo?.signOut({ (error, signOut) in
            self.outcome(error: error, isSuccessful: signOut)
        })
    }
    internal func outcome(error: String?, isSuccessful: Bool) {
        if isSuccessful {
            self.accountManagementView?.readyForNavigation()
            self.accountManagementView?.navigate()
        } else {
            self.accountManagementView?.displayError(error: error!)
        }
    }
}
