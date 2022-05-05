//
//  ViewController.swift
//  eggTimer
//
//  Created by Hugo Silva on 04/05/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var mainLabel: UILabel!
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        var runCount = 0
        timer.invalidate()
        progressBar.progress = 0
        if let hardness = sender.currentTitle {
            if let temp = eggTimes[hardness] {
                self.mainLabel.text = "\(hardness) egg"
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    runCount += 1
                    self.progressBar.progress = Float(runCount)/Float(temp)
                    if runCount == temp {
                        self.mainLabel.text = "Done!"
                        self.playSound()
                        timer.invalidate()
                    }
                }
            }
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

