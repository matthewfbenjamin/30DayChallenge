//
//  VideoTableViewController.swift
//  playLocalVideo
//
//  Created by Matthew Benjamin on 4/13/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoTableViewController: UITableViewController {
    //var iphoneVideo: NSURL = https://www.youtube.com/watch?v=MZwsbcW-d-E
    
    var allYouTubeVideoURL = [NSURL(string: "https://www.youtube.com/watch?v=Wk5qT_814xM"), NSURL(string: "https://www.youtube.com/watch?v=ViuDsy7yb8M"), NSURL(string: "https://www.youtube.com/watch?v=mnf74-Bxtsg"), NSURL(string: "https://www.youtube.com/watch?v=NAVsBfOjc4c"), NSURL(string: "https://www.youtube.com/watch?v=MZwsbcW-d-E")]
    var allYouTubeVideoNames = ["iPhone 6s - Timer - Behind The Scenes", "Fantastic Beasts and Where to Find Them - Teaser Trailer ", "DO TEENS KNOW 2000s MUSIC?", "The Real Saul Goodman from 'Breaking Bad' and 'Better Call Saul'?", "Suicide Squad – Blitz Trailer "]
    var allYouTubeVideoImage = ["CookieMonster", "FantasticBeasts", "React", "SaulGoodman", "SuicideSquad"]
    
    var passAlongID: NSURL?
    var passAlongRow = 0
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allYouTubeVideoImage.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "VideoCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        
        var videoURL = allYouTubeVideoURL[indexPath.row]
        passAlongID = videoURL
        passAlongRow = indexPath.row
        

        
        cell.videoName.text = allYouTubeVideoNames[indexPath.row]
        cell.videoPreviewImage.image = UIImage(named: allYouTubeVideoImage[indexPath.row])
        
        cell.playButton.addTarget(self, action: #selector(VideoTableViewController.segueToVideoViewController), forControlEvents: .TouchUpInside)
        
        return cell
    }
    
    func segueToVideoViewController() {
        self.performSegueWithIdentifier("showVideoSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showVideoSegue") {
                // initialize new view controller and cast it as your view controller
                let nextScene = segue.destinationViewController as! VideoViewController
            
                    // your new view controller should have property that will store passed value
                    if let paid = passAlongID{
                        nextScene.newAllYouTubeVideoID = paid
                        nextScene.newPassAlongRow = passAlongRow
                    }
            
                }
        
        }
    
}

