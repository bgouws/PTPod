//
//  PlayMusicVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTPlayMusic {
    //var ptDetails = [PTTrackDetails]()
    var ptArtwork = [UIImage]()
    
    static func setTrackDetails(trackDetails: [PTTrackDetails]) -> [PTTrackDetails] {
        let ptDetails = trackDetails
        return ptDetails
    }
    static func setTrackArt(art: [UIImage]) -> [UIImage]{
        let ptArtwork = art
        return ptArtwork
    }
}
