//
//  postViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/07.
//

import Foundation

public class postViewModel {
    var id: String
    var trackTitle: String
    var trackArtist: String
    public init(id: String, trackTitle: String, trackArtist: String) {
        self.id = id
        self.trackTitle = trackTitle
        self.trackArtist = trackArtist
    }
    public func setFavourite() {
        let _ = ptPost(id: self.id, trackTitle: self.trackTitle, trackArtist: self.trackArtist)
    }
}
