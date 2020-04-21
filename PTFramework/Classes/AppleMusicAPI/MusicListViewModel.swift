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
    public var count: Int
    public var isTimerRunning = false
    private var counter:Float = 0

    required public init() {
        count = 0
        repo?.getListOfTracks { result, isSuccessful in
            switch result {
            case .failure(let error) : print(error)
            case .success(let listOfTracks) : self.list = listOfTracks
            }
        }
    }
    public func getListOfTracks(index: Int, indexUpNext: Int) {
        repo?.getListOfTracks { result, isSuccessful in
            switch result {
            case .failure(let error) : print(error)
            case .success(let listOfTracks) : self.list = listOfTracks
            }
            if isSuccessful {
                self.view?.loadCurrentTrack(listOfTracks: self.list[index])
                self.view?.loadNextTrack(listOfTracks: self.list[index + 1])
            } else {
                self.view?.displayError(error: "An error has occured")
            }
        }
    }
}
