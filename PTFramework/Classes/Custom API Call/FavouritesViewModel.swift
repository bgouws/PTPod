//
//  FavouritesViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/17.
//

public class FavouritesViewModel {
    var entirePlaylist = [Favourites]()
    public init() {
    }
    public func getPlayList(completion: @escaping([Favourites]) -> Void) {
        let playlist = PlayListRequest.init(uid: "vPosNoZakIUMo5AY0a9fGa4Hs4m2")
        playlist.getPlayList { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let customPlaylist):
                self?.entirePlaylist = customPlaylist
                completion(customPlaylist)
                print("$$$$")
                print("\(customPlaylist[0].id)")
                print("\(customPlaylist[0].trackArtist ?? "Nothing Here")")
                print("\(customPlaylist[0].trackTitle ?? "Nothing Here")")
                print("$$$$")
            }
        }
    }
}
