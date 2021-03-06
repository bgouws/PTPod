//
//  AppleMusicAPIRepo.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/20.
//

import Foundation

public class MusicListRepo: MusicListDataSourceType {
    let resourceURL: URL
    required public init?(genre: String) {
        let link = "https://itunes.apple.com/search/media=music&entity=song&term="
        let apiQuery = "\(link)\(genre)"
        guard let resourceURL = URL(string: apiQuery) else { return nil }
        self.resourceURL = resourceURL
    }
    public func getListOfTracks(completion: @escaping(Result<[TrackDetails], TracksError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let tracksResponse = try decoder.decode(ListOfTracks.self, from: jsonData)
                let actualData = tracksResponse.results
                completion(.success(actualData))
            } catch {
                completion(.failure(.noData))
            }
        }
            dataTask.resume()
        }
}
