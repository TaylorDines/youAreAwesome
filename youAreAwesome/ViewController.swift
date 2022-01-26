//
//  ViewController.swift
//  youAreAwesome
//
//  Created by Taylor Dines on 1/25/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🤯viewDidLoad has run!")
        messageLabel.text = "Fablous? That's You"
    }

    @IBAction func messageButtonPress(_ sender: UIButton) {
        print("🥵The message buttom was pressed!")
        messageLabel.text = "You Are Awesome!"
    }
    
}

