//
//  MusicListDataSourceType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/20.
//

import Foundation

public protocol MusicListDataSourceType: class {
    init?(genre: String)
    func getListOfTracks(completion: @escaping(Result<[TrackDetails], TracksError>) -> Void)
}

public enum TracksError: Error {
    case noData
}
