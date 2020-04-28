//
//  MusicTasteViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/24.
//

import Foundation

public class MusicTasteViewModel: MusicTasteViewModelType {
    public weak var view: MusicTasteViewType?
    public var repo: MusicTasteRepoType?
    required public init() { }
    public func storeTaste(tasteList: [String]) {
        repo?.storeTaste(taste: tasteList, completion: { (result) in
            switch result {
            case .success(let didSaveData):
                self.view?.musicTasteSaved(didSaveData: didSaveData)
            case .failure(let error):
                self.view?.displayError(error: error)
            }
        })
    }
    public func getMusicTaste() {
        repo?.getTaste(completion: { result in
            switch result {
            case .success(let musicTasteList):
                self.view?.dataReady(genre: musicTasteList[Int.random(in: 0 ..< musicTasteList.count)])
            case .failure(let error):
                self.view?.displayError(error: error)
            }
        })
    }
}
