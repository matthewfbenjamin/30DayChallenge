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
    
    var allYouTubeVideoID = ["Wk5qT_814xM", "ViuDsy7yb8M", "mnf74-Bxtsg", "NAVsBfOjc4c", "MZwsbcW-d-E"]
    var allYouTubeVideoNames = ["iPhone 6s - Timer - Behind The Scenes", "Fantastic Beasts and Where to Find Them - Teaser Trailer ", "DO TEENS KNOW 2000s MUSIC?", "The Real Saul Goodman from 'Breaking Bad' and 'Better Call Saul'?", "Suicide Squad – Blitz Trailer "]
    var allYouTubeVideoImage = ["CookieMonster", "FantasticBeasts", "React", "SaulGoodman", "SuicideSquad"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allYouTubeVideoID.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "VideoCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell

        cell.videoName.text = allYouTubeVideoNames[indexPath.row]
        cell.videoPreviewImage.image = UIImage(named: allYouTubeVideoImage[indexPath.row])
        
        return cell
    }
    
    
    
    
}
