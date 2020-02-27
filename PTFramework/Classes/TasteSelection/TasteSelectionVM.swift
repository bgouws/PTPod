//
//  TasteSelectionVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public class PTTasteSelection {
    public static func ptSaveMusicTaste(taste: [String]) {
        let ref = Database.database().reference()
        let user = Auth.auth().currentUser?.uid
        ref.child("users").child(user!).setValue(["Music Taste": taste])
        print("Music taste successfully saved - PTFramework")
    }
    public static func ptCheckList(value: String, taste: [String]) -> Bool {
        for genre in taste where genre == value {
            return true
        }
          return false
    }
}
