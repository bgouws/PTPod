//
//  UserModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/18.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public class userModel {
    var ref = Database.database().reference()
    public func getData() {
        let uid = Auth.auth().currentUser?.uid
        ref.child("users").child(uid!).child("Tasks")
    }
}

public struct ToDoTask {
    var uid: String
    var title: String
    var hour: String
    var minute: String
    var second: String
}
