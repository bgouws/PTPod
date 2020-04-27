//
//  TaskManipulationRepo.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public class TaskManipulationRepo: TaskManipulationRepoType {
    required public init() { }
    public func addNewTask(newTask: Task, completion: @escaping (Result<Bool, Error>) -> Void) {
        let ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        ref.child("users").child(userID).child("Tasks").observeSingleEvent(of: .value, with: { (snapshot) in
            let childCount = snapshot.childrenCount
            ref.child("users").child(userID).child("Tasks")
                .child("Task\(Int(childCount+1))").setValue(["Title": newTask.taskTitle,
                                                             "Hour": newTask.taskHour,
                                                             "Minute": newTask.taskMinute,
                                                             "Second": newTask.taskSecond,
                                                             "Location": newTask.location])
            completion(.success(true))
        }) { (error) in
            completion(.failure(error))
        }
    }
}
