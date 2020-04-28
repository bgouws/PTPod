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
    let dispatchGroup = DispatchGroup()
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
    public func removeTask(newList: [Task], completion: @escaping (Result<Bool, Error>) -> Void) {
        let ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        let total = newList.count
        ref.child("users").child(userID).child("Tasks").removeValue()
        for task in 0..<total {
            ref.child("users").child(userID).child("Tasks").child("Task\(task+1)").setValue(["Title": newList[task].taskTitle,
                                                                                             "Hour": newList[task].taskHour,
                                                                                             "Minute": newList[task].taskMinute,
                                                                                             "Second": newList[task].taskSecond,
                                                                                             "Location": newList[task].location])
            { (error: Error?, _: DatabaseReference) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
            }
        }
    }
}
