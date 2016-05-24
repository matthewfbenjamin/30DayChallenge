//
//  ViewController.swift
//  13 - EmojiSlotMachine
//
//  Created by Matthew Benjamin on 5/24/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: Properties
    
    @IBOutlet weak var betAmountLabel: UILabel!
    @IBOutlet weak var bankAmountLabel: UILabel!
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    
    
    
    @IBAction func pullLeverButton(sender: AnyObject) {
    
        pickerViewOutlet.selectRow(Int(arc4random()) % 90, inComponent: 0, animated: true)
        pickerViewOutlet.selectRow(Int(arc4random()) % 90, inComponent: 1, animated: true)
        pickerViewOutlet.selectRow(Int(arc4random()) % 90, inComponent: 2, animated: true)

    }
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRectZero
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageArray = ["👻","🍒","🔑","💍","🏅"]
        
        for i in 0 ..< 100 {
            dataArray1.append((Int)(arc4random() % 5 ))
            dataArray2.append((Int)(arc4random() % 5 ))
            dataArray3.append((Int)(arc4random() % 5 ))
        }
        
        pickerViewOutlet.delegate = self
        pickerViewOutlet.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pickerView Functions:
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        switch component {
            case 0 : pickerLabel.text = imageArray[(Int)(dataArray1[row])]
            case 1 : pickerLabel.text = imageArray[(Int)(dataArray2[row])]
            case 2 : pickerLabel.text = imageArray[(Int)(dataArray3[row])]
            default : print("Defualt")
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        return pickerLabel
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    
    //MARK: PLACE BETS
    
    @IBAction func oneButtonClicked(sender: AnyObject) {
    }

    @IBAction func fiveButtonClicked(sender: AnyObject) {
    }
    
    @IBAction func tenButtonClicked(sender: AnyObject) {
    }
    
    @IBAction func twentyFiveButtonClicked(sender: AnyObject) {
    }
    
    @IBAction func allButtonClicked(sender: AnyObject) {
    }
    
    @IBAction func resetBankButtonClicked(sender: AnyObject) {
    }
    
    @IBAction func resetBetButtonClicked(sender: AnyObject) {
    }
    
    
    
}

