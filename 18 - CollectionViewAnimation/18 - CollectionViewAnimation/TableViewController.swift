//
//  TableViewController.swift
//  18 - CollectionViewAnimation
//
//  Created by Matthew Benjamin on 8/25/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let icons = ["abra","bellsprout","bullbasaur","caterpie","charmander","dratini","eevee","mankey","meowth","mew","pidgey","pikachu","psyduck","rattata","snorlax","squirtle","venonat","weedle","zubat"]
    var passAlongName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 20
        }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.icons.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        cell.iconImageView.image = UIImage(named: icons[indexPath.row])
        
        return cell
        
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .Normal, title: "More") { action, index in
            self.passAlongName = self.icons[indexPath.row]
            self.performSegueWithIdentifier("mySegue", sender: nil)
            
        }
        more.backgroundColor = UIColor.blackColor()
        
        let favorite = UITableViewRowAction(style: .Normal, title: "Favorite") { action, index in
            print("favorite button tapped")
            
        }
        
        favorite.backgroundColor = UIColor.orangeColor()
        
        let share = UITableViewRowAction(style: .Normal, title: "Share") { action, index in
            self.displayShareSheet(self.icons[indexPath.row])
        }
        share.backgroundColor = UIColor.blueColor()
        
        return [share, favorite, more]
    }
    
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mySegue") {
            let vc = segue.destinationViewController as! ImageViewController
            vc.pokeName = passAlongName
            
        }
    }
    
    /*override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        <#code#>
    }*/


}
