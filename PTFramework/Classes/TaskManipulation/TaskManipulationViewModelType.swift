//
//  TaskManipulationViewModelType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public protocol TaskManipulationViewModelType {
    var view: AddTaskViewType? { get set }
    var repo: TaskManipulationRepoType? { get set }
    init()
    func addNewItem(newTask: Task)
}
