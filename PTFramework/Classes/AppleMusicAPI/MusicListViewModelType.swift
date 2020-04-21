//
//  AppleMusicViewModelType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/20.
//

import Foundation

public protocol MusicListViewModelType {
    var list: [TrackDetails] {get set}
    var listError: String {get set}
    var view: MusicListViewType? {get set}
    var repo: MusicListDataSourceType? {get set}
    init()
    func getListOfTracks(index: Int, indexUpNext: Int)
}
