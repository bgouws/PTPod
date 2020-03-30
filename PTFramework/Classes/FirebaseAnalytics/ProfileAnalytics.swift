//
//  ProfileAnalytics.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/30.
//

import Foundation

public class ProfileAnalytics {
    public init() {
    }
    public func profileTapped() {
        Analytics.logEvent("ProfilePic_pressed", parameters: nil)
    }
    public func loadedProfileData() {
        Analytics.logEvent("profile_data_loaded", parameters: nil)
    }
    public func setProfileData() {
        Analytics.logEvent("profile_data_set", parameters: nil)
    }
}
