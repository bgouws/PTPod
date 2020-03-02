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
        //Calling Model
        PTTaste.ptStoreTaste(taste: taste)
    }
    public static func ptCheckList(value: String, taste: [String]) -> Bool {
        for genre in taste where genre == value {
            return true
        }
          return false
    }
}
