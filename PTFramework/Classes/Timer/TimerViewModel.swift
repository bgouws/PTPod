//
//  TimerVM.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/02.
//

import Foundation
import AVFoundation
import CoreMedia

public class PTTimer {
    static var ptTitle = ""
    static var ptArtist = ""
    static var ptArt = UIImage()
    static var ptPreview = ""
    static var tCount = 0
    static var nextTrack: AVPlayerItem?
    static var finalTitle = "Default"
    static var finalArtist = "Default"
    static var player: AVPlayer?
    static var playerItem: AVPlayerItem?
    static var timer = Timer()
    public static var isTimerRunning = false
    static var counter = 0.0
    static var fHour = ""
    static var fMinute = ""
    static var fSecond = ""
    static var fTitle = ""
    public static func ptInitialLoad() -> [Any]{
    //Setting up first track
        ptTitle = PTPlayMusic.getTitle(count: tCount)
        ptArtist = PTPlayMusic.getArtist(count: tCount)
        ptArt = PTPlayMusic.getArtwork(count: tCount)
        ptPreview = PTPlayMusic.getPreviewuRL(count: tCount)
        nextTrack = loadNextTrack()
        
        ///Adding track data to an array of any (String, String, UIImage)
        var trackData = [Any]()
        trackData.append(ptTitle)
        trackData.append(ptArtist)
        trackData.append(ptArt)
        
        let fUrl = URL(string: ptPreview)
        let fPlayerItem: AVPlayerItem = AVPlayerItem(url: fUrl!)
        player = AVPlayer(playerItem: fPlayerItem)
        player?.pause()
        return trackData
    }
    public static func ptStart() {
        print("Starting Player")
        player!.play()
    }
    
    public static func ptStopPlayback() {
        player!.pause()
    }
        static func timerSetUp() {
            isTimerRunning = true
        }
        public static func setupTrack() {
            //Setting up tracks
            ptTitle = PTPlayMusic.getTitle(count: tCount)
            ptArtist = PTPlayMusic.getArtist(count: tCount)
            ptArt = PTPlayMusic.getArtwork(count: tCount)
            ptPreview = PTPlayMusic.getPreviewuRL(count: tCount)
            player = AVPlayer(playerItem: nextTrack)
            print("Play next track")
            player?.play()
            nextTrack = loadNextTrack()
        }
        static func loadNextTrack() -> AVPlayerItem {
            print("Load Function called")
            print(tCount)
            let ptNextPreview = PTPlayMusic.getPreviewuRL(count: tCount)
            let url = URL(string: ptNextPreview)
            let nextTrack: AVPlayerItem = AVPlayerItem(url: url!)
            tCount += 1
            print("Count has been incremented")
            print(tCount)
            return nextTrack
        }
        public static func ptStop() {
            player?.pause()
            isTimerRunning = false
            timer.invalidate()
        }
        //@objc public static func playerDidFinishPlaying(note: NSNotification) {
        //    print("Song Finished - Loading next")
        //}
        public static func ptBackToList() {
            player!.pause()
            isTimerRunning = false
            counter = 0.0
        }
        public static func ptResetTimer() {
            player?.pause()
            isTimerRunning = false
            timer.invalidate()
            counter = 0.0
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