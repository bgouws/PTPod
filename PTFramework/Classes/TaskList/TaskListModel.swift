//
//  TaskModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/22.
//

import Foundation

public struct Tasks {
    var listOfTasks: [Task]
}
public struct Task {
    public var taskTitle: String
    public var taskHour: String
    public var taskMinute: String
    public var taskSecond: String
}
