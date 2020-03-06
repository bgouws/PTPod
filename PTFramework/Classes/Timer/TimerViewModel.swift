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
    var ptTitle = ""
    var ptArtist = ""
    var ptArt = UIImage()
    var ptPreview = ""
    var tCount = 0
    var pCount = 0
    var nextTrack: AVPlayerItem?
    var finalTitle = "Default"
    var finalArtist = "Default"
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    var timer = Timer()
    public var isTimerRunning = false
    var counter = 0.0
    var fHour = ""
    var fMinute = ""
    var fSecond = ""
    var fTitle = ""
    let myPTPlayMusic = PTPlayMusic()
    public init() {
        
    }
    public func ptInit() -> [Any] {
        ptTitle = PTPlayMusic.getTitle(count: tCount)
        ptArtist = PTPlayMusic.getArtist(count: tCount)
        ptPreview = PTPlayMusic.getPreviewuRL(count: tCount)
        nextTrack = loadNextTrack()
        
        ///Adding track data to an array of any (String, String, UIImage)
        var trackData = [Any]()
        trackData.append(ptTitle)
        trackData.append(ptArtist)
        trackData.append(ptArt)
        //ptInitialLoad()
        return trackData
    }
    public func ptInitialLoad() {
        let fUrl = URL(string: ptPreview)
        let fPlayerItem: AVPlayerItem = AVPlayerItem(url: fUrl!)
        player = AVPlayer(playerItem: fPlayerItem)
        //player?.pause()
    }
    public func ptStart() {
        print("Starting Player")
        player!.play()
    }
    
    public func ptStopPlayback() {
        player!.pause()
    }
       public func timerSetUp() {
            isTimerRunning = true
        }
        public func setupTrack() {
            //Setting up tracks
            ptTitle = PTPlayMusic.getTitle(count: tCount)
            ptArtist = PTPlayMusic.getArtist(count: tCount)
            ptPreview = PTPlayMusic.getPreviewuRL(count: tCount)
            player?.play()
            //PTPlayMusic.prepareImage()
        }
        public func loadNextTrack() -> AVPlayerItem {
            let ptNextPreview = PTPlayMusic.getPreviewuRL(count: tCount)
            let url = URL(string: ptNextPreview)
            let nextTrack: AVPlayerItem = AVPlayerItem(url: url!)
            player = AVPlayer(playerItem: nextTrack)
            PTPlayMusic.prepareImage()
            tCount += 1
            return nextTrack
        }
        public func ptStop() {
            player?.pause()
            isTimerRunning = false
            timer.invalidate()
        }
        public func ptBackToList() {
            player!.pause()
            isTimerRunning = false
            counter = 0.0
        }
        public func ptResetTimer() {
            player?.pause()
            isTimerRunning = false
            timer.invalidate()
            counter = 0.0
        }
    }
