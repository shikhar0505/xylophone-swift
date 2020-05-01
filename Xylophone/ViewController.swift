//
//  ViewController.swift
//  Xylophone
//
//  Created by Shikhar Kumar on 1/5/20.
//  Copyright © 2020 Shikhar Kumar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    var timerStarted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundFile: sender.currentTitle!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundFile: String) {
        guard let url = Bundle.main.url(forResource: soundFile, withExtension: "wav") else { return }

        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }

            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

