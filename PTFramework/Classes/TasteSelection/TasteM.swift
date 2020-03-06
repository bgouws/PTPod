//
//  TasteM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/28.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

public class PTTaste {
    public func ptStoreTaste(taste: [String]) {
        let ref = Database.database().reference()
        let user = Auth.auth().currentUser?.uid
        ref.child("users").child(user!).setValue(["Music Taste": taste])
        print("Music taste successfully saved - PTFramework")
        }
}
