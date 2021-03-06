//
//  AccountManagementViewProtocol.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/15.
//

import Foundation

public protocol AccountManagementViewType: class {
    func readyForNavigation()
    func navigate()
    func displayError(error: String)
}
