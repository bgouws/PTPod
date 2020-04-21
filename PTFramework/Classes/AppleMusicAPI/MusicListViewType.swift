//
//  MusicListViewType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/20.
//

import Foundation

public protocol MusicListViewType: class {
    func loadCurrentTrack(currentTrack: TrackDetails)
    func loadNextTrack(nextTrack: TrackDetails)
    func displayError(error: String)
}
