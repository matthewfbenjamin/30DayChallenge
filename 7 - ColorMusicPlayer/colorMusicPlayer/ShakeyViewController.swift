
//
//  ShakeyViewController.swift
//  colorMusicPlayer
//
//  Created by Matthew Benjamin on 5/7/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ShakeyViewController: UIViewController {

    var backgroundMusicPlayer = AVAudioPlayer()
    let gradientLayer = CAGradientLayer()
    var isPlaying: Bool = false
    var timer: NSTimer?
    var timeToPlay: NSTimeInterval = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //graditent color
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).CGColor as CGColorRef
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).CGColor as CGColorRef
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).CGColor as CGColorRef
        let color5 = UIColor(white: 0.4, alpha: 0.2).CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 1)
        self.view.layer.addSublayer(gradientLayer)
        
        
        UIApplication.sharedApplication().statusBarHidden =  true
        
        let newBackButton = UIBarButtonItem(title: "< Back To Home", style: UIBarButtonItemStyle.Bordered, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;

    }
    
    //MARK: Play Button Clicked
    @IBAction func playButtonWasClicked(sender: AnyObject) {
        
        //MARK: No Audio Playing
        if isPlaying == false {
            let song = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("DearlyDeparted", ofType: "mp3")!)
            
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: song, fileTypeHint: nil)
                backgroundMusicPlayer.numberOfLoops = -1
                backgroundMusicPlayer.prepareToPlay()
                backgroundMusicPlayer.playAtTime(backgroundMusicPlayer.deviceCurrentTime + timeToPlay)
                isPlaying = true
            }
                
            catch let error as NSError {
                print(error.description)
            }
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(RHCPViewController.randomColor), userInfo: nil, repeats: true)
            
            let redValue = CGFloat(drand48())
            let blueValue =  CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            
            self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            
            //Graditent color
            gradientLayer.frame = view.bounds
            let color1 = UIColor(white: 0.5, alpha: 0.2).CGColor as CGColorRef
            let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).CGColor as CGColorRef
            let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).CGColor as CGColorRef
            let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).CGColor as CGColorRef
            let color5 = UIColor(white: 0.4, alpha: 0.2).CGColor as CGColorRef
            
            gradientLayer.colors = [color1, color2, color3, color4, color5]
            gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
            gradientLayer.startPoint = CGPointMake(0, 0)
            gradientLayer.endPoint = CGPointMake(1, 1)
            self.view.layer.addSublayer(gradientLayer)
            
            
        }
            
        //MARK: Audio Is Playing
        else {
            timeToPlay = backgroundMusicPlayer.deviceCurrentTime
            print(timeToPlay)
            timer!.invalidate()
            let redValue = CGFloat(drand48())
            let blueValue =  CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            backgroundMusicPlayer.pause()
            isPlaying = false
        }
    }
    
    //MARK: Additional Functions
    func back(sender: UIBarButtonItem) {
        backgroundMusicPlayer.pause()
        timer!.invalidate()
        self.navigationController?.popViewControllerAnimated(true)
    }
    func randomColor() {
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }

}
