//
//  AddNewTaskAnalytics.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/30.
//

import Foundation

public class AddNewTaskAnalytics {
    public init() {
    }
    public func addNewTask() {
        Analytics.logEvent("AddNew_button_pressed", parameters: nil)
        Analytics.logEvent("TaskTitle_pressed", parameters: nil)
        Analytics.logEvent("Picker_pressed", parameters: nil)
        Analytics.logEvent("CreateTask_pressed", parameters: nil)
    }
    public func pickerTimeSet() {
        Analytics.logEvent("time_set_successfully", parameters: nil)
    }
}
