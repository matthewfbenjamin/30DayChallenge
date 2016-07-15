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
    var resetFont = false
    
    
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
        let labelCount = 140 - numberOfChars
        
        if labelCount > 10 {
            
            charCountLabel.textColor = UIColor.whiteColor()
            
            if resetFont{
                charCountLabel.font = UIFont(name:"HelveticaNeue", size: 25.0)
                UIView.animateWithDuration(0.5, animations: {
                    self.charCountLabel.transform = CGAffineTransformScale(self.charCountLabel.transform, 0.38554328943, 0.38554328943)
                })
                
                resetFont = false
            }
        }
            
        if labelCount<=10 && labelCount>0 {
            charCountLabel.textColor = UIColor.redColor()
            charCountLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
            //charCountLabel.transform = CGAffineTransformScale(charCountLabel.transform, 0.35, 0.35);
            UIView.animateWithDuration(0.5, animations: {
                self.charCountLabel.transform = CGAffineTransformScale(self.charCountLabel.transform, 1.1, 1.1)
            })
            resetFont = true
            
        }
        
        charCountLabel.text = String(labelCount)
        
        return numberOfChars < 140;
    }


}

/*
 func flashBG(){
 UIView.animateWithDuration(0.7, animations: {
 self.view.backgroundColor = UIColor.greenColor()
 
 })
 }
 */
