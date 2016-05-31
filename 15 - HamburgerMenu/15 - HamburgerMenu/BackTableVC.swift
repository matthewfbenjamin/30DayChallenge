//
//  backTableVC.swift
//  15 - TopSlideMenu
//
//  Created by Matthew Benjamin on 5/31/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import Foundation
import UIKit

class BackTableVC: UITableViewController {
    
    var tableArray = [String]()
    
    override func viewDidLoad() {
        tableArray = ["Hello","Second","World"]
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(tableArray[indexPath.row], forIndexPath: indexPath)
        
        cell.textLabel?.text = tableArray[indexPath.row]
        
        return cell

    }
     
 
    
}

