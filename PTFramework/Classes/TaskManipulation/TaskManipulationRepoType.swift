//
//  TaskManipulationRepoType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public protocol TaskManipulationRepoType {
    func addNewTask(newTask: Task, completion: @escaping (Result<Bool, Error>) -> Void)
    func removeTask(newList: [Task], completion: @escaping (Result<Bool, Error>) -> Void)
}
