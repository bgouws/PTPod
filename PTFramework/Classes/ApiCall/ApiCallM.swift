//
//  ApiCallVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTApiCall {
    public static func ptCallApi() {
        
    }
    
    enum PTTracksError:Error {
        case noData
    }
    struct PTTrackRequest {
        let resourceURL: URL
        //let aPI_KEY = "//itunes.apple.com/search"
        init(trackTitle: String, trackArtist: String) {
            let currentTrackTitle = trackTitle.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            let currentTrackArtist = trackArtist.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            let apiQuery = "https://itunes.apple.com/search/media=music&entity=song&term=\(currentTrackTitle)+\(currentTrackArtist)"
            guard let resourceURL = URL(string: apiQuery) else {fatalError()}
            self.resourceURL = resourceURL
        }
        
        func ptGetData(completion: @escaping(Result<[PTTrackDetails], PTTracksError>) -> Void)  {
            let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
                guard let jsonData = data else {
                    completion(.failure(.noData))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let tracksResponse = try decoder.decode(PTTracks.self, from: jsonData)
                    let actualData = tracksResponse.results
                    (completion(.success(actualData)))
                } catch {
                    completion(.failure(.noData))
                }
            }
            dataTask.resume()
        }
    }
}

