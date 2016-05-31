//
//  ViewController.swift
//  15 - HamburgerMenu
//
//  Created by Matthew Benjamin on 5/31/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var openButton: UIBarButtonItem!
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openButton.target = self.revealViewController()
        openButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
         if varView == 0{
         labelOutlet.text = "Strings"
         }else{
         labelOutlet.text = "Others"
         }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

