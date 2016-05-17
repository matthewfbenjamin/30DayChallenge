//
//  ViewController.swift
//  10 - SimpleRESTApiCall
//
//  Created by Matthew Benjamin on 5/16/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    
    var getEndpoint: String = "http://swapi.co/api/people/1/"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func viewDidAppear(animated: Bool) {
        getFunction()
        postFunction()
    }
    
        //MARK: GET
        
        func getFunction(){
        //let postEndpoint: String = "https://httpbin.org/ip"
        let url = NSURL(string: getEndpoint)!
        
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(url,completionHandler: {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in

            //Read the JSON
            do{
                if NSString(data: data!, encoding: NSUTF8StringEncoding) != nil {
                    
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary

                    let name = jsonDictionary["name"] as! String
                    let height = jsonDictionary["height"] as! String
                    let birthYear = jsonDictionary["birth_year"] as! String

                    //Update the label
                    self.performSelectorOnMainThread(#selector(ViewController.updateName(_:)), withObject: name, waitUntilDone: false)
                    self.performSelectorOnMainThread(#selector(ViewController.updateHeight(_:)), withObject: height, waitUntilDone: false)
                    self.performSelectorOnMainThread(#selector(ViewController.updateYear(_:)), withObject: birthYear, waitUntilDone: false)
                }
            } catch{
                print("bad things happen")
            }
        }).resume()
    }
    
    
    func postFunction() {
        let postEndpoint: String = "http://requestb.in/191aq961"
        let url = NSURL(string: postEndpoint)!
        let session = NSURLSession.sharedSession()
        let postParams : [String: AnyObject] = ["hello": "Hello  POST world!"]
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        do{
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(postParams, options: NSJSONWritingOptions())
            print(postParams)
        } catch{
            print("bad things happened")
        }
        
        session.dataTaskWithRequest(request, completionHandler: {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
        }).resume()
    }

    
    //MARK: - Methods to update the UI immediately
    func updateName(text: String) {
        self.nameLabel.text = "Name: " + text
    }
    func updateHeight(text: String) {
        self.heightLabel.text = "Height: " + text
    }
    func updateYear(text: String) {
        self.yearLabel.text = "Year of Birth: " + text
    }
    
}

