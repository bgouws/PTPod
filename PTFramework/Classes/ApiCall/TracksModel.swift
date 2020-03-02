//
//  TracksM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public struct PTTracks: Decodable {
    var results: [PTTrackDetails]
}

public struct PTTrackDetails: Decodable {
    var artistName: String
    var trackName: String
    var artworkUrl100: String
    var collectionName: String
    var previewUrl: String
}
