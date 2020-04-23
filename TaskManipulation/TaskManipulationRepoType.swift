//
//  TaskManipulationRepoType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public protocol TaskManipulationRepoType {
    func addNewTask(taskTitle: String, hour: String, minute: String,
    second: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
