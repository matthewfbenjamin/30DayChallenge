//
//  ViewController.swift
//  pullToRefresh
//
//  Created by Matthew Benjamin on 5/4/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {

    struct Movie {
        let title: String
        let genre: String
    }
    
    var movies = [
        Movie(title: "Finding Nemo", genre: "Animation"),
        Movie(title: "Jurassic World", genre: "Sci-Fi")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributes = [NSForegroundColorAttributeName: UIColor.blackColor()]

        self.refreshControl?.addTarget(self, action: #selector(TableVC.handleRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        cell.textLabel?.text = movies[indexPath.row].title
        cell.detailTextLabel?.text = movies[indexPath.row].genre
        
        return cell
    }


    func handleRefresh(refreshControl: UIRefreshControl) {
        
        let newMovie = Movie(title: "Lion King", genre: "Animation")
        movies.append(newMovie)
        
        movies.sortInPlace() { $0.title < $1.title }
        
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
}

