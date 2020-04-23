//
//  TaskRepo.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/22.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public class TaskListRepo: TaskListRepoType {
    let dispatchGroup = DispatchGroup()
    public init() { }
    public func getTaskList(completion: @escaping(Result<[Task], Error>) -> Void) {
        var tasks: [Task] = []
        let cycleCompleteWorkItem = DispatchWorkItem{ completion(.success(tasks)) }
        let ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        ref.child("users").child(userID).child("Tasks").observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.childrenCount
            for task in 1...data {
                self.dispatchGroup.enter()
                ref.child("users").child(userID).child("Tasks").child("Task\(task)")
                    .observeSingleEvent(of: .value) { (snapshot) in
                    let value = snapshot.value as? NSDictionary
                    let taskTitle = value?["Title"] as? String ?? ""
                    let hour = value?["Hour"] as? String ?? ""
                    let minute = value?["Minute"] as? String ?? ""
                    let second = value?["Second"] as? String ?? ""
                        let tempTask = Task(taskTitle: taskTitle, taskHour: hour,
                                            taskMinute: minute, taskSecond: second)
                    tasks.append(tempTask)
                    self.dispatchGroup.leave()
                }
            }
            self.dispatchGroup.notify(queue: DispatchQueue.main, work: cycleCompleteWorkItem )
        }) {(error) in
            completion(.failure(error))
        }
    }
}
