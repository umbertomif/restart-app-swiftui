//
//  AudioPlayer.swift
//  Restart
//
//  Created by Umberto M. I. Ferreira on 2022/09/19.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type:String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        } catch {
            print("Could not play the sound file.")
        }
    }
}
