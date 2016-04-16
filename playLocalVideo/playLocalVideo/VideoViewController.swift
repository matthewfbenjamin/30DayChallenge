//
//  ViewController.swift
//  playLocalVideo
//
//  Created by Matthew Benjamin on 4/11/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoViewController: UIViewController {
    
    
    @IBOutlet var playerView: YouTubePlayerView!
    var newAllYouTubeVideoID: NSURL?
    var newPassAlongRow: Int?
    
    override func viewDidLoad() {
        print(newAllYouTubeVideoID)
        print(newPassAlongRow)
        
        /*playerView.playerVars = [
            "playsinline": "1",
            "controls": "1",
            "showinfo": "1"
        ]
        */
        /*if let theYouTubeID = newAllYouTubeVideoID{
            playerView.loadVideoURL(theYouTubeID)
        }
        playerView.play()*/
    }
}

