//
//  TaskListViewAnalytics.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/30.
//

import Foundation

public class TaskListViewAnalytics {
    public init() {
    }
    public func taskSelected() {
        Analytics.logEvent("Task_selected_from_list", parameters: nil)
    }
    public func taskDeleted() {
        Analytics.logEvent("Task_deleted_from_list", parameters: nil)
    }
}
