//
//  ViewController.swift
//  youAreAwesome
//
//  Created by Taylor Dines on 1/25/22.
//



import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let numberOfImages = 10
    let numberOfSounds = 6
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription). Could not initialize AVAudioPlayer object")
            }
        } else {
            print("ERROR: Could not read data from file \(name)")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperlimit: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperlimit)
        } while originalNumber == newNumber
        return newNumber
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "Fabulous? That's You!",
                        "You've Got The Design Skills of Jony Ive"]
      
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperlimit: messages.count-1)
        messageLabel.text = messages [messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperlimit: numberOfImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperlimit: numberOfSounds-1)
        if playSoundSwitch.isOn { // if playSoundSwitch is on
            playSound(name: "sound\(soundNumber)") // then play the sound
        }
    }
    
    @IBAction func playSoundToggled( sender: UISwitch) {
        //do not try to stop audioPlayer if audioPlayer is still nil
        if !sender.isOn && audioPlayer != nil { //if .isOn is NOT true
                audioPlayer.stop()//stop playing
            }
        }
    }


