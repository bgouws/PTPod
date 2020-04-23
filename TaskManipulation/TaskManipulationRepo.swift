//
//  TaskManipulationRepo.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/23.
//

import Foundation

public class TaskManipulationRepo: TaskManipulationRepoType {
    required public init() { }
    public func addNewTask(taskTitle: String, hour: String, minute: String,
                           second: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).child("Tasks").observeSingleEvent(of: .value, with: { (snapshot) in
            let childCount = snapshot.childrenCount
            ref.child("users").child(userID!).child("Tasks")
                .child("Task\(Int(childCount+1))").setValue(["Title": taskTitle,
                                                             "Hour": hour,
                                                             "Minute": minute,
                                                            "Second": second])
            completion(.success(true))
        }) { (error) in
            completion(.failure(error))
        }
    }
}
