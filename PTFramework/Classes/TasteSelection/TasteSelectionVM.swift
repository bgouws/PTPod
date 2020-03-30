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
    public init() {
    }
    public func ptSaveMusicTaste(taste: [String]) {
        let myPTTaste = PTTaste()
        myPTTaste.ptStoreTaste(taste: taste)
    }
    public func ptCheckList(value: String, taste: [String]) -> Bool {
        var flag = false
        for genre in taste where genre == value {
            flag = true
            return flag
        }
        flag = false
        return flag
    }
}
