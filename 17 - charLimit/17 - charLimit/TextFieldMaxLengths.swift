//
//  TextFieldMaxLengths.swift
//  17 - charLimit
//
//  Created by Matthew Benjamin on 7/15/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

// 1
private var maxLengths = [UITextView: Int]()

// 2
extension UITextView {
    
    // 3
    @IBInspectable var maxLength: Int {
        get {
            // 4
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            // 5
            addTarget(
                self,
                action: #selector(limitLength),
                forControlEvents: UIControlEvents.EditingChanged
            )
        }
    }
    
    func limitLength(textField: UITextView) {
        // 6
        guard let prospectiveText = textField.text
            where prospectiveText.characters.count > maxLength else {
                return
        }
        
        let selection = selectedTextRange
        // 7
        text = prospectiveText.substringWithRange(
            Range<String.Index>(prospectiveText.startIndex ..< prospectiveText.startIndex.advancedBy(maxLength))
        )
        selectedTextRange = selection
    }
    
}