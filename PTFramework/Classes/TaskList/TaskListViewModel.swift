//
//  TaskViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/22.
//

import Foundation

public class TaskListViewModel: TaskListViewModelType {
    public var list = [Task]()
    public weak var view: TaskListViewType?
    public var repo: TaskListRepoType?
    required public init() { }
    public func getListOfTasks() {
        self.repo?.getTaskList(completion: { (result) in
            switch result {
            case .success(let listOfTasks):
                self.list = listOfTasks
                self.view?.loadData(listOfTasks: self.list)
                self.view?.dataReady()
            case .failure(let error) :
                self.view?.displayError(error: error)
            }
        })
    }
}
