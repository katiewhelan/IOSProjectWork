//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    var player = AVAudioPlayer()
    
    @IBAction func eggSelected(_ sender: UIButton) {
        timer.invalidate()
        let eggType = sender.currentTitle!
        progressBar.progress = 0.0
        titleLable.text = eggType
        totalTime = eggTimes[eggType]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {

        if secondsPassed < totalTime {
            secondsPassed += 1
            var progressPercent = Float(secondsPassed)/Float(totalTime)
            print(progressPercent)
            progressBar.progress = progressPercent
        }else{
            timer.invalidate()
            titleLable.text = "DONE"
            playSound()
        }
        
    }
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
               player.play()
    }
}
