//
//  TaskManipulationViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public class TaskManipulationViewModel: TaskManipulationViewModelType {
public weak var view: AddTaskViewType?
public var repo: TaskManipulationRepoType?
required public init() { }
    public func addNewItem(taskTitle: String, hour: String, minute: String, second: String) {
        self.repo?.addNewTask(taskTitle: taskTitle, hour: hour,
                              minute: minute, second: second, completion: { result  in
            switch result {
            case .success(let didWriteData):
                self.view?.taskAdded(didWriteData: didWriteData)
            case .failure(let error):
                self.view?.displayError(error: error)
            }
        })
    }
}
