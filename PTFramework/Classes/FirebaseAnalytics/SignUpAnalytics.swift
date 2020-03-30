//
//  SignUpAnalytics.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/30.
//

import Foundation

public class SignUpAnalytics {
    public init() {
    }
    public func successfulSignUp() {
        Analytics.logEvent(AnalyticsEventSignUp, parameters: nil)
        Analytics.logEvent("SignUp_pressed", parameters: nil)
        Analytics.logEvent("txtEmail_data_entered", parameters: nil)
        Analytics.logEvent("txtPassword_data_entered", parameters: nil)
        Analytics.logEvent("txtPasswordCon_data_entered", parameters: nil)
        Analytics.logEvent("CreateAccount_pressed", parameters: nil)
    }
    public func unsuccessfulSignUp() {
        Analytics.logEvent("unsuccessful_signup", parameters: nil)
    }
}
