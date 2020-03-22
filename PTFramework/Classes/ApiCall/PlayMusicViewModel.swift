//
//  PlayMusicVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/02/26.
//

import Foundation

public class PTPlayMusic {
    public var ptArtwork: [UIImage] = []
    public static var ptTitle: [String] = []
    public static var ptArtist: [String] = []
    public static var ptPreviewUrl: [String] = []
    public static var ptArtString: [String] = []
    public static var currentImage: [UIImage] = []
    static var count = 0
    
    public func readData() {
        PTApiCall.ptPreparePlayList()
    }
    public init() {
        
    }
    public static func setData(artist: [String], title: [String],previewURL: [String], artString: [String]){
        self.ptTitle = title
        self.ptArtist = artist
        self.ptPreviewUrl = previewURL
        self.ptArtString = artString
        prepareImage()
    }
    public static func prepareImage() {
        let url = ptArtString[count]
        let finalURL = URL(string: url)
        if let data = try? Data(contentsOf: finalURL!) {
            if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self.currentImage.append(image)
                }
            }
        }
        self.count += 1
    }
    public static func getImage(count: Int) -> UIImage {
        return currentImage[count]
    }
    public static func getTitle(count: Int) -> String {
        return ptTitle[count]
    }
    public static func getArtist(count: Int) -> String {
        return ptArtist[count]
    }
    public static func getPreviewuRL(count: Int) -> String {
        return ptPreviewUrl[count]
    }
    public static func loadNextImage(nextImg: Int, completion: @escaping(UIImage) -> Void) {
        let url = ptArtString[nextImg]
        let finalURL = URL(string: url)
        if let data = try? Data(contentsOf: finalURL!) {
            if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
}
