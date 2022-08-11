//
//  ViewController.swift
//  xylophone
//
//  Created by Cáren Sousa on 09/08/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
        UIView.animate(withDuration: 0.2) {
                sender.alpha = 0.5
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
                UIView.animate(withDuration: 0.2) {
                    sender.alpha = 1.0
                }
            }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: "Sounds/\(soundName)", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

