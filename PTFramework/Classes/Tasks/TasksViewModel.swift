//
//  TasksViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/29.
//

import Foundation

public class TasksViewModel {
    var tasks: [PTTask] = []
    public init() {
        let task1 = PTTask(title: "Sample", hour: "00", minute: "00", second: "10")
        tasks.append(task1)
    }
    public func getTasks() -> [PTTask] {
        return tasks
    }
    public func getListOfTasks(completion: @escaping ([PTTask]) -> ()) {
        let myData = PTTask(title: "Data", hour: "00", minute: "00", second: "00")
        myData.getTaskList { (tasks) in
            completion(tasks)
        }
    }
    public func getListOfTasksCount(completion: @escaping (Int) -> ()) {
        let myData = PTTask(title: "Data", hour: "00", minute: "00", second: "00")
        myData.getTaskCount { (childCount) in
            completion(childCount)
        }
    }
    public func insertTask(taskTitle: String, hour: String, minute: String, second: String, completion: (Bool) -> ()) {
        let myData = PTTask(title: "Data", hour: "00", minute: "00", second: "00")
        var outcome = false
        myData.addNewTask(taskTitle: taskTitle, hour: hour, minute: minute, second: second) { (success) in
            if success {
                print("Task added successfully \(success)")
                outcome = true
            } else {
                print("Something went wrong \(success)")
                outcome = false
            }
        }
        completion(outcome)
    }
}
