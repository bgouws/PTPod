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
    public func storeTaste(taste: [String], completion: @escaping(Result<Bool, Error>) -> Void) {
        let ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        var musicTaste: [String: String] = [:]
        for userTaste in 0..<taste.count {
            musicTaste["taste\(userTaste)"] = taste[userTaste]
        }
        ref.child("users").child(userID).child("MusicTaste").child("MusicTaste").setValue(musicTaste)
        { (error: Error?, _: DatabaseReference) in
            if let error = error {
                completion(.failure(error))
                return
            }
        }
        ref.child("users").child(userID).child("Details").setValue(["bio": "Tell us something about yourself!",
                                                                    "firstName": "Put your name here!",
                                                                    "lastName": "Put your last name here!"])
        { (error: Error?, _: DatabaseReference) in
            if let error = error {
                completion(.failure(error))
                return
            }
        }
        ref.child("users").child(userID).child("Tasks").child("Task1").setValue(["Hour": "00",
                                                                                 "Minute": "01",
                                                                                 "Second": "30",
                                                                                 "Title": "Sample",
                                                                                 "Location": "Location: Sample"])
        { (error: Error?, _: DatabaseReference) in
            if let error = error {
                completion(.failure(error))
                return
            }
        }
        completion(.success(true))
    }
    public func getTaste(completion: @escaping(Result<[String], Error>) -> Void) {
        let ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        ref.child("users").child(userID).child("MusicTaste").child("MusicTaste").observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.childrenCount
            let value = snapshot.value as? NSDictionary
            var genreList: [String] = []
            for genres in 0...data-1 {
                let gen = value?["taste\(genres)"] as? String ?? "Default"
                genreList.append(gen)
            }
            completion(.success(genreList))
        }) {(error) in
            completion(.failure(error))
        }
    }
}
