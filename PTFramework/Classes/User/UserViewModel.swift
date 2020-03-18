//
//  UserModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/18.
//

import Foundation

class User {
    var musicTaste: String
    var uid: String

    init(musicTaste: String, uid: String) {
        self.musicTaste = musicTaste
        self.uid = uid
    }
}
