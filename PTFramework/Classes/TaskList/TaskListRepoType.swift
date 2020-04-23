//
//  TaskListDataSouceType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/22.
//

import Foundation

public protocol TaskListRepoType: class {
    func getTaskList(completion: @escaping(Result<[Task], Error>) -> Void)
}
