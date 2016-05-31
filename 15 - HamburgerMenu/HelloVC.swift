//
//  HelloVC.swift
//  15 - HamburgerMenu
//
//  Created by Matthew Benjamin on 5/31/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import Foundation

class HelloVC:  UIViewController{
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}