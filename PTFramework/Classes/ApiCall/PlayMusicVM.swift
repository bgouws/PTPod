//
//  PlayMusicVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTPlayMusic {
    public static func ptPrint() {
        print("##########")
        var listOfTracks = [PTTrackDetails]()
        let myRequest = PTApiCall.PTTrackRequest.init(trackTitle: "Shake it off", trackArtist: "Taylor swift")
        myRequest.ptGetData { result in
        switch result {
        case .failure(let error): print(error)
        case .success(let actualData): listOfTracks = actualData
        }
            for i in 1...30 {
                print("\(listOfTracks[i].artistName) - \(listOfTracks[i].trackName)")
            }
            //finalURL = URL(string: val.artworkUrl100)!
            //self.imgArtWork.loadImage(url: finalURL)
        }
        print("##########")
    }
}

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
