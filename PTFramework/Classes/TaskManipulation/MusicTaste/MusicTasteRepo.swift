//
//  MusicTasteRepo.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/24.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public class MusicTasteRepo: MusicTasteRepoType {
    public required init() { }
    public func StoreTaste(taste: [String], completion: @escaping(Result<Bool, Error>) -> Void) {
        let ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        ref.child("users").child(userID).child("MusicTaste").setValue(["MusicTaste": taste]) {
            (error: Error?, ref:DatabaseReference) in
            if let error = error {
                completion(.failure(error))
                return
            }
        }
        ref.child("users").child(userID).child("Details").setValue(["bio": "Tell us something about yourself!",
                                                                    "firstName": "Put your name here!",
                                                                    "lastName": "Put your last name here!"]) {
            (error: Error?, ref:DatabaseReference) in
            if let error = error {
                completion(.failure(error))
                return
            }
        }
        ref.child("users").child(userID).child("Tasks").child("Task1").setValue(["Hour": "00",
                                                                                 "Minute": "01",
                                                                                 "Second": "30",
                                                                                 "Title": "Sample"]) {
            (error: Error?, ref:DatabaseReference) in
            if let error = error {
                completion(.failure(error))
                return
            }
                                                                                    
        }
        completion(.success(true))
    }
}
