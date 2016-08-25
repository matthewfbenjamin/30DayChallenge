//
//  ImageViewController.swift
//  18 - CollectionViewAnimation
//
//  Created by Matthew Benjamin on 8/25/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var pokeName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pN = pokeName {
            imageView.image = UIImage(named: pN)
            labelName.text = pN
        }
    }

    @IBAction func modalButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)

    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
