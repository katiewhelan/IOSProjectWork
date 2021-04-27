//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(buttonClicked: sender.currentTitle!)
        sender.alpha = 0.5
        delayWithSeconds(1, completion: {sender.alpha = 1})
        
        
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
   
    
    func playSound(buttonClicked: String) {
        let url = Bundle.main.url(forResource: buttonClicked, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        
    }
    
}
               




