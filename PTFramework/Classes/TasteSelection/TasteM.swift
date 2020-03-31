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
        ref.child("users").child(user!).child("MusicTaste").setValue(["MusicTaste": taste])
        ref.child("users").child(user!).child("Details").setValue(["bio": "Tell us something about yourself!",
                                                                   "firstName": "Put your name here!",
                                                                   "lastName": "Put your last name here!"])
        ref.child("users").child(user!).child("Tasks").child("Task1").setValue(["Hour": "00",
                                                                                "Minute": "01",
                                                                                "Second": "30",
                                                                                "Title": "Sample"])
        print("Music taste successfully saved - PTFramework")
        let profile = ProfileModel()
        let image = UIImage(named: "DefaultUser")
        profile.setProfileImage(user!, image!) { (output) in
            print(output)
        }
    }
}
