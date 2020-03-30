//
//  LoginAnalytics.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/30.
//

import Foundation

public class LoginAnalytics {
    public init() {
    }
    public func successfulLogin() {
        Analytics.logEvent(AnalyticsEventLogin, parameters: nil)
        Analytics.logEvent("SignIn_button_pressed", parameters: nil)
    }
    public func unsuccessfulLogin() {
        Analytics.logEvent("unsuccessful_login", parameters: nil)
    }
}
