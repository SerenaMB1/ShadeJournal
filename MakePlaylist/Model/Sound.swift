//
//  Sound.swift
//  MakePlaylist
//
//  Created by Serena Badesha on 05/11/2021.
//

import Foundation
import AVFoundation
import AVFAudio

var audioPlayer: AVAudioPlayer?

class Sound {
    
    func playShadeSound(){
        
        let soundFileName = "shade"
        
        guard let soundPath = Bundle.main.path(forResource: soundFileName, ofType: "mp3") else {
            fatalError("unable to find \(soundFileName) in bundle")
        }
        let url = URL(fileURLWithPath: soundPath)
        do {
            // Configure and activate the AVAudioSession
            try AVAudioSession.sharedInstance().setCategory(
                    AVAudioSession.Category.playback
            )

            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        }   catch {
            print(error.localizedDescription)
        }
        audioPlayer?.play()
    }
    
}
