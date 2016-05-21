//
//  ViewController.swift
//  fontChanger
//
//  Created by Matthew Benjamin on 4/10/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ViewController: UIViewController {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var lastNumber:UInt32?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: "Arial", size: 20)
        symbolLabel.font = UIFont.fontAwesomeOfSize(100)
        symbolLabel.text = String.fontAwesomeIconWithName(FontAwesome.HandSpockO)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeFontButtonClicked(sender: AnyObject) {
        var randomNumber = arc4random_uniform(5)
        //var lastNumber: UInt32?
        if let lN = lastNumber {
            if randomNumber == lN && randomNumber < 4{
                randomNumber += 1
            }
                
            else if randomNumber == lN && randomNumber >= 4{
                randomNumber = 0
            }
            print("Random number \(randomNumber), Last Number \(lN)")
        }
        
        switch randomNumber {
        case 0:
            lastNumber = 0
            titleLabel.font = UIFont(name: "American Typewriter", size: 20)
            symbolLabel.text = String.fontAwesomeIconWithName(FontAwesome.Github)
        case 1:
            lastNumber = 1
            titleLabel.font = UIFont(name: "Apple Color Emjoi", size: 20)
            symbolLabel.text = String.fontAwesomeIconWithName(FontAwesome.RedditAlien)
            
        case 2:
            lastNumber = 2
            titleLabel.font = UIFont(name: "Chalkduster", size: 20)
            symbolLabel.text = String.fontAwesomeIconWithName(FontAwesome.Apple)
            
        case 3:
            lastNumber = 3
            titleLabel.font = UIFont(name: "Noteworthy", size: 20)
            symbolLabel.text = String.fontAwesomeIconWithName(FontAwesome.Rebel)
            
        case 4:
            lastNumber = 4
            titleLabel.font = UIFont(name: "Zapfino", size: 20)
            symbolLabel.text = String.fontAwesomeIconWithName(FontAwesome.Spotify)
            
        default:
            titleLabel.font = UIFont(name: "Arial", size: 20)
            symbolLabel.text = String.fontAwesomeIconWithName(FontAwesome.HandSpockO)
        }
        
    }

}

