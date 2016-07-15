//
//  ViewController.swift
//  17 - charLimit
//
//  Created by Matthew Benjamin on 7/15/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var charCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).stringByReplacingCharactersInRange(range, withString: text)
        let numberOfChars = newText.characters.count
        charCountLabel.text = String(140 - numberOfChars)
        return numberOfChars < 140;
    }


}

