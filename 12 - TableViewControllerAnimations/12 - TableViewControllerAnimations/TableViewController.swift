//
//  ViewController.swift
//  12 - TableViewControllerAnimations
//
//  Created by Matthew Benjamin on 5/21/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let titles = ["Candy", "Water Drop", "Glasses", "Hamburger", "Hotdog", "Knife", "Map", "Packman Ghost", "Pizza", "Toaster"]
    let icons = ["candy", "drop", "glasses", "hamburger", "hotdog", "knife", "map", "packman", "pizza", "toaster"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.icons.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        
        cell.labelOutlet.text = titles[indexPath.row]
        cell.iconImageView.image = UIImage(named: icons[indexPath.row])
        
        return cell

    }
    
    override func viewDidLoad() {
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    /* func colorforIndex(index: Int) -> UIColor {
        
        let itemCount = titles.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.backgroundColor =  colorforIndex(indexPath.row)
        
    }*/
    
    override func viewWillAppear(animated: Bool) {
        animateTable()
    }
    
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
}

