//
//  ApiCallVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTApiCall {
    public static var artistArr = [String]()
    public static var titleArr = [String]()
    public static var artArr = [String]()
    public static var albumArt = [UIImage]()
    public static var previewURL = [String]()
    
    public static func ptCallApi() {
        
    }
    
    public enum PTTracksError:Error {
        case noData
    }
    public struct PTTrackRequest {
        let resourceURL: URL
        //let aPI_KEY = "//itunes.apple.com/search"
        init(trackTitle: String, trackArtist: String) {
            let currentTrackTitle = trackTitle.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            let currentTrackArtist = trackArtist.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            let apiQuery = "https://itunes.apple.com/search/media=music&entity=song&term=\(currentTrackTitle)+\(currentTrackArtist)"
            guard let resourceURL = URL(string: apiQuery) else {fatalError()}
            self.resourceURL = resourceURL
        }
        
        public func ptGetData(completion: @escaping(Result<[PTTrackDetails], PTTracksError>) -> Void)  {
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
    public static func ptPreparePlayList() {
        var list = [PTTrackDetails]()
        let myRequest = PTApiCall.PTTrackRequest.init(trackTitle: "Jazz", trackArtist: "Jazz")
        myRequest.ptGetData { result in
            switch result {
            case .failure(let error): print(error)
            case .success(let actualData): list = actualData
            }
            for i in 0...10 {
                //print("\(i): \(list[i].artistName) - \(list[i].trackName)")
                let url = list[i].artworkUrl100
                let finalURL = URL(string: url)
                if let data = try? Data(contentsOf: finalURL!) {
                    if let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            albumArt.append(image)
                            //print(albumArt)
                        }
                    }
                }
            }
            for i in 0...10 {
                print("\(i): \(list[i].artistName) - \(list[i].trackName) \n")
            }
            //Creating textfile test
            let fileName = "Tracks"
            // swiftlint:disable all
            let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask,
                                                              appropriateFor: nil, create: true)
            // swiftlint:enable all
            let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
            print("File Path: \(fileURL.path)")
            var writeString = ""
            for i in 0...10 {
                writeString += ("\(i)*\(list[i].artistName)*\(list[i].trackName)*\(list[i].artworkUrl100)*\(list[i].previewUrl)$")
            }
            do {
                //Write to file
                try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("Failed to write to URL ")
                print(error)
            }
            var readString = ""
            do {
                readString = try String(contentsOf: fileURL)
            } catch let error as NSError {
                print("Failed to read file")
                print(error)
            }
            print("Contents of the file: \n\(readString)")
            //Test
            
            
            let everyTrackDetail = readString.components(separatedBy: "$")
            for track in 0...10 {
                let temp = everyTrackDetail[track]
                let data = temp.components(separatedBy: "*")
                artistArr.append(data[1])
                titleArr.append(data[2])
                artArr.append(data[3])
                previewURL.append(data[4])
            }
            PTPlayMusic.setData(artist: artistArr, title: titleArr, artwork: albumArt, previewURL: previewURL)
            print("Successfully populated arrays")
        }
    }
}
