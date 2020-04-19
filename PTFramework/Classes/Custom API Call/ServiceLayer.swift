//
//  ServiceLayer.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/17.
//

import Foundation

import Foundation

public struct PlayListTrackList: Decodable {
    var favList: [Favourites]
}
public struct Favourites: Decodable {
    public var id: String
    public var trackTitle: String?
    public var trackArtist: String?
}
public enum PlayListError: Error {
    case noData
    case cannotProcessData
}
public struct PlayListRequest {
    let resourceURL: URL
    public init(uid: String) {
        let resourceString = "http://localhost:8080/favList/\(uid)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    public func getPlayList(completion: @escaping(Result<[Favourites], PlayListError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let playListResponse = try decoder.decode(PlayListTrackList.self, from: jsonData)
                let all = playListResponse.favList
                completion(.success(all))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
}
