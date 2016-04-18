//
//  ViewController.swift
//  snapChatMenu
//
//  Created by Matthew Benjamin on 4/17/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit
import AVFoundation

class RightViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftVC = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let rightVC = CameraViewController(nibName: "CameraViewController", bundle: nil)
        
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMoveToParentViewController(self)
        
        var frame1 = rightVC.view.frame
        frame1.origin.x = self.view.frame.size.width
        rightVC.view.frame = frame1
        
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMoveToParentViewController(self)

        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height)
        
        
    }
    
}
