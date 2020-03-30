//
//  CurrentTaskAnalytics.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/30.
//

import Foundation

public class CurrentTaskAnalytics {
    public init() {
    }
    public func timerStopped() {
        Analytics.logEvent("timer_Stoped", parameters: nil)
    }
    public func timerStarted() {
        Analytics.logEvent("timer_Started", parameters: nil)
    }
    public func musicStart() {
        Analytics.logEvent("start_button_pressed", parameters: nil)
        Analytics.logEvent("music_started", parameters: nil)
        timerStarted()
    }
    public func musicPause() {
        Analytics.logEvent("pause_button_pressed", parameters: nil)
        Analytics.logEvent("music_paused", parameters: nil)
        timerStopped()
    }
    public func musicReset() {
        Analytics.logEvent("reset_button_pressed", parameters: nil)
        Analytics.logEvent("music_reset", parameters: nil)
        timerStopped()
    }
    public func musicBackToList() {
        Analytics.logEvent("back_button_pressed", parameters: nil)
    }
    public func nextTrack() {
        Analytics.logEvent("nextTrack_button_pressed", parameters: nil)
    }
}
