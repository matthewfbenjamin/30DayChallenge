//
//  ViewController.swift
//  ImageScrollView
//
//  Created by Matthew Benjamin on 5/10/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var theImageView: UIImageView!
    var image = UIImage()
    
    
    @IBOutlet weak var scrollView: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        theImageView.image = image
        
    }
}