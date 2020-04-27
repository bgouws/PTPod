//
//  TaskModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/22.
//

import Foundation

public struct Task {
    public var taskTitle: String
    public var taskHour: String
    public var taskMinute: String
    public var taskSecond: String
    public var location: String
    public init(taskTitle: String, taskHour: String, taskMinute: String, taskSecond: String, location: String) {
        self.taskTitle = taskTitle
        self.taskHour = taskHour
        self.taskMinute = taskMinute
        self.taskSecond = taskSecond
        self.location = location
    }
}
