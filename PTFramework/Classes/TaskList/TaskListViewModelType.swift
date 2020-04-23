//
//  TaskListViewModelType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public protocol TaskListViewModelType {
    var list: [Task] { get set }
    var view: TaskListViewType? { get set }
    var repo: TaskListRepoType? { get set }
    init()
    func getListOfTasks()
}
