//
//  PlayMusicVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTPlayMusic {
    //var ptDetails = [PTTrackDetails]()
    public static var ptArtwork: [UIImage] = []
    public static var ptTitle: [String] = []
    public static var ptArtist: [String] = []
    public static var ptPreviewUrl: [String] = []
    
    public static func readData() {
        print("Calling Api")
        PTApiCall.ptPreparePlayList()
    }
    public static func setData(artist: [String], title: [String], artwork: [UIImage], previewURL: [String]){
        self.ptTitle = title
        self.ptArtist = artist
        self.ptArtwork = artwork
        self.ptPreviewUrl = previewURL
    }
    public static func getTitle(count: Int) -> String {
        return ptTitle[count]
    }
    public static func getArtist(count: Int) -> String {
        return ptArtist[count]
    }
    public static func getArtwork(count: Int) -> UIImage {
        return ptArtwork[count]
    }
    public static func getPreviewuRL(count: Int) -> String {
        return ptPreviewUrl[count]
    }
}
