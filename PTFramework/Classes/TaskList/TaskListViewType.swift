//
//  TaskListViewType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/22.
//

import Foundation

public protocol TaskListViewType: class {
    func dataReady()
    func displayError(error: Error)
    func loadData(listOfTasks: [Task])
}
