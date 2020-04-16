//
//  AccountManagementViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/15.
//

import Foundation

public class AccountManagementViewModel {
    public weak var accountManagementView: AccountManagementViewProtocol?
    public var accountManagementRepo: AccountManagementDSProtocol?
    public init() {
    }
    public func login(email: String, password: String) {
        accountManagementRepo?.login(email: email, password: password, { (error, signedIn) in
            self.outcome(error: error, outcome: signedIn)
        })
    }
    public func signUp(email: String, password: String) {
        accountManagementRepo?.signUp(email: email, password: password, { (error, accountCreated) in
            self.outcome(error: error, outcome: accountCreated)
        })
    }
    public func signOut() {
        accountManagementRepo?.signOut({ (error, signOut) in
            self.outcome(error: error, outcome: signOut)
        })
    }
    private func outcome(error: String?, outcome: Bool) {
        if outcome {
            self.accountManagementView?.readyForNavigation()
            self.accountManagementView?.navigate()
        } else {
            self.accountManagementView?.displayError(error: error!)
        }
    }
}
