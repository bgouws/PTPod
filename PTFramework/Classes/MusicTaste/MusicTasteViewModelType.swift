//
//  MusicTasteViewModelType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/24.
//

import Foundation

public protocol MusicTasteViewModelType {
    var view: MusicTasteViewType? { get set }
    var repo: MusicTasteRepoType? { get set }
    init() 
    func storeTaste(tasteList: [String])
}
