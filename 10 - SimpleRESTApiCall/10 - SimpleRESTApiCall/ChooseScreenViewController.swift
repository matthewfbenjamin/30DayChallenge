//
//  ChooseScreenViewController.swift
//  10 - SimpleRESTApiCall
//
//  Created by Matthew Benjamin on 5/16/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class ChooseScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func lukeButtonPresses(sender: AnyObject) {
        performSegueWithIdentifier("lukeSegue", sender: self)

    }

    @IBAction func c3poButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("c3poSegue", sender: self)

    }
    
    @IBAction func r2d2ButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("r2Segue", sender: self)

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "lukeSegue" {
            
            if let nextViewController = segue.destinationViewController as? ViewController {
                
                nextViewController.getEndpoint = "http://swapi.co/api/people/1/"
            }
        }
        if segue.identifier == "c3poSegue" {
            
            if let nextViewController = segue.destinationViewController as? ViewController {
                
                nextViewController.getEndpoint = "http://swapi.co/api/people/2/"
            }
        }

        if segue.identifier == "r2Segue" {
            
            if let nextViewController = segue.destinationViewController as? ViewController {
                
                nextViewController.getEndpoint = "http://swapi.co/api/people/3/"
            }
        }

    }

    

}

