//
//  MusicTasteRepoType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/24.
//

import Foundation

public protocol MusicTasteRepoType {
    init()
    func storeTaste(taste: [String], completion: @escaping(Result<Bool, Error>) -> Void)
}
