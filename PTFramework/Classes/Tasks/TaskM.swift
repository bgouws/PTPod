//
//  Task.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/02.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

public class PTTask {
    public var title: String
    public var  hour: String
    public var  minute: String
    public var  second: String
    public init(title: String, hour: String, minute: String, second: String) {
        self.title = title
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    public func getTaskList(completion: @escaping ([PTTask]) -> ()) {
        var tasks: [PTTask] = []
        let ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).child("Tasks").observeSingleEvent(of: .value) { (snapshot) in
            let data = snapshot.childrenCount
            for task in 1...data {
                ref.child("users").child(userID!).child("Tasks").child("Task\(task)").observeSingleEvent(of: .value) { (snapshot) in
                    let value = snapshot.value as? NSDictionary
                    let taskTitle = value?["Title"] as? String ?? ""
                    let hour = value?["Hour"] as? String ?? ""
                    let minute = value?["Minute"] as? String ?? ""
                    let second = value?["Second"] as? String ?? ""
                    let tempTask = PTTask(title: taskTitle, hour: hour, minute: minute, second: second)
                    tasks.append(tempTask)
                    if (task == data) {
                        completion(tasks)
                    }
                }
            }
        }
    }
    public func getTaskCount(completion: @escaping (Int) -> ()) {
        let ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).child("Tasks").observeSingleEvent(of: .value) { (snapshot) in
            let childCount = snapshot.childrenCount
            completion(Int(childCount))
        }
    }
    public func addNewTask(taskTitle: String, hour: String, minute: String, second: String, completion: @escaping (_ val: Bool) -> ()) {
        getTaskCount { (taskCount) in
            let userID = Auth.auth().currentUser?.uid
            let ref = Database.database().reference()
            ref.child("users").child(userID!).child("Tasks").child("Task\(taskCount+1)").setValue(["Title": taskTitle,
                                                                                                 "Hour": hour,
                                                                                                 "Minute": minute,
                                                                                                 "Second": second])
            {
                (error:Error?, ref:DatabaseReference) in
                if let error = error {
                    print("Data could not be saved: \(error).")
                } else {
                    print("Data saved successfully!")
                }
            }
        }
        completion(true)
    }
}


