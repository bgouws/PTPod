//
//  AppleMusicModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/20.
//

import Foundation

public struct ListOfTracks: Decodable {
    var results: [TrackDetails]
}
public struct TrackDetails: Decodable {
    public var artistName: String
    public var trackName: String
    public var artworkUrl100: String
    public var collectionName: String
    public var previewUrl: String
}
