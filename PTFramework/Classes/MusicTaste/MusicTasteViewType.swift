//
//  MusicTasteViewType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/24.
//

import Foundation

public protocol MusicTasteViewType: class {
    func musicTasteSaved(didSaveData: Bool)
    func dataReady(genre: String)
    func displayError(error: Error)
}
