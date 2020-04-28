//
//  TaskManipulationViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public class TaskManipulationViewModel: TaskManipulationViewModelType {
public weak var view: TaskManipulationViewType?
public var repo: TaskManipulationRepoType?
required public init() { }
    public func addNewItem(newTask: Task) {
        self.repo?.addNewTask(newTask: newTask, completion: { result  in
            switch result {
            case .success(let didWriteData):
                self.view?.taskAdded(didWriteData: didWriteData)
            case .failure(let error):
                self.view?.displayManipulationError(error: error)
            }
        })
    }
    public func removeTask(newList: [Task]) {
        self.repo?.removeTask(newList: newList, completion: { result in
            switch result {
            case .failure(let error):
                self.view?.displayManipulationError(error: error)
            case .success(let isSuccessful):
                self.view?.taskRemoved(isSuccessful: isSuccessful)
            }
        })
    }
}
