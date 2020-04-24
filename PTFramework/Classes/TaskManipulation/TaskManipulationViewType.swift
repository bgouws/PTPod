//
//  AddTaskViewType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public protocol AddTaskViewType: class {
    func taskAdded(didWriteData: Bool)
    func displayError(error: Error)
}
