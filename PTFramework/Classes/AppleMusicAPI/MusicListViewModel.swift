//
//  AppleMusicViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/20.
//

import Foundation
import AVFoundation

public class MusicListViewModel: MusicListViewModelType {
    public var list = [TrackDetails]()
    public var listError: String = ""
    public weak var view: MusicListViewType?
    public var repo: MusicListDataSourceType?
    public var isTimerRunning = false

    required public init() {
    }
    public func getListOfTracks(index: Int, indexUpNext: Int) {
        repo?.getListOfTracks { result in
            switch result {
            case .failure(let error) :
                self.view?.displayError(error: error.localizedDescription)
            case .success(let listOfTracks) :
                self.list = listOfTracks
                self.view?.loadCurrentTrack(currentTrack: self.list[index])
                self.view?.loadNextTrack(nextTrack: self.list[index + 1])
            }
        }
    }
}
