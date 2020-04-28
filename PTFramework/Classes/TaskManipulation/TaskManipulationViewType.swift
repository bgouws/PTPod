//
//  AddTaskViewType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public protocol TaskManipulationViewType: class {
    func taskAdded(didWriteData: Bool)
    func displayManipulationError(error: Error)
    func taskRemoved(isSuccessful: Bool)
}
