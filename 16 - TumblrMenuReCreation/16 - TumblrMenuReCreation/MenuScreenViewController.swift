//
//  MenuScreenViewController.swift
//  16 - TumblrMenuReCreation
//
//  Created by Matthew Benjamin on 6/5/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit
import FontAwesome_swift

class MenuScreenViewController: UIViewController {
    
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelButtonOutlet.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTouched(sender: AnyObject) {
        self.performSegueWithIdentifier("unWindToMain", sender: self)
    }
}
