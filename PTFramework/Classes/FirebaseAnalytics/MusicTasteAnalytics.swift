//
//  MusicTasteAnalytics.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/30.
//

import Foundation

public class MusicTasteAnalytics {
    public init() {
    }
    public func musicTasteRock() {
        Analytics.logEvent("Rock_button_pressed", parameters: nil)
    }
    public func musicTastePop() {
        Analytics.logEvent("Pop_button_pressed", parameters: nil)
    }
    public func musicTasteIndie() {
        Analytics.logEvent("Indie_button_pressed", parameters: nil)
    }
    public func musicTasteHipHop() {
        Analytics.logEvent("HipHop_button_pressed", parameters: nil)
    }
    public func musicTasteCountry() {
        Analytics.logEvent("Country_button_pressed", parameters: nil)
    }
    public func musicTasteJazz() {
        Analytics.logEvent("Jazz_button_pressed", parameters: nil)
    }
    //Create Music Taste
    public func musicTasteStored() {
        Analytics.logEvent("MusicTaste_stored", parameters: nil)
    }
}
