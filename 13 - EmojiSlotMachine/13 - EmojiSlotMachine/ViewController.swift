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
    var betAmt: Int = 0
    var bankAmt: Int = 100
    var tempBankAmt: Int = 0
    
    var twoMatch = false
    var threeMatch = false
    var noMatch = false
    
    @IBAction func pullLeverButton(sender: AnyObject) {
    
        pickerViewOutlet.selectRow(Int(arc4random()) % 90, inComponent: 0, animated: true)
        pickerViewOutlet.selectRow(Int(arc4random()) % 90, inComponent: 1, animated: true)
        pickerViewOutlet.selectRow(Int(arc4random()) % 90, inComponent: 2, animated: true)
        
        //MARK: Find the bet factor
        
        if(dataArray1[pickerViewOutlet.selectedRowInComponent(0)] == dataArray2[pickerViewOutlet.selectedRowInComponent(1)] && dataArray1[pickerViewOutlet.selectedRowInComponent(0)] != dataArray3[pickerViewOutlet.selectedRowInComponent(2)]) {
            
            twoMatch = true
            threeMatch = false
            noMatch = false
        }
        else if(dataArray1[pickerViewOutlet.selectedRowInComponent(0)] == dataArray3[pickerViewOutlet.selectedRowInComponent(2)] && dataArray1[pickerViewOutlet.selectedRowInComponent(0)] != dataArray2[pickerViewOutlet.selectedRowInComponent(1)]){
            
            twoMatch = true
            threeMatch = false
            noMatch = false
        }
        else if(dataArray2[pickerViewOutlet.selectedRowInComponent(1)] == dataArray3[pickerViewOutlet.selectedRowInComponent(2)] && dataArray1[pickerViewOutlet.selectedRowInComponent(0)] != dataArray2[pickerViewOutlet.selectedRowInComponent(1)]){
            
            twoMatch = true
            threeMatch = false
            noMatch = false
        }

        else if(dataArray1[pickerViewOutlet.selectedRowInComponent(0)] == dataArray2[pickerViewOutlet.selectedRowInComponent(1)] && dataArray2[pickerViewOutlet.selectedRowInComponent(1)] == dataArray3[pickerViewOutlet.selectedRowInComponent(2)]){
            
            twoMatch = false
            threeMatch = true
            noMatch = false
        }
            
        else{
            twoMatch = false
            threeMatch = false
            noMatch = true
        }
        
        print(twoMatch)
        print(threeMatch)
        print(noMatch)
        
        if twoMatch{
            bankAmt += betAmt * 2
            print(betAmt)
            print(bankAmt)
            updateLabel(bankAmt)
        }
        if threeMatch{
            bankAmt += betAmt * 4
            print(betAmt)
            print(bankAmt)
            updateLabel(bankAmt)
        }
        if noMatch{
            updateLabel(bankAmt)
        }

        //betAmt = 0
        
        if(bankAmt>300){
            let alertController = UIAlertController(title: "WINNER", message:
                "Congrats, You Win", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            bankAmt = 100
            betAmt = 0
            updateLabel(bankAmt)
        }
    } // END PULL LEVEL
    
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

        bankAmountLabel.text = "\(bankAmt)"
        betAmountLabel.text = "\(betAmt)"
        
        imageArray = ["👻","🍒","🔑","💍","🏅"]
        
        for _ in 0 ..< 100 {
            dataArray1.append((Int)(arc4random() % 5 ))
            dataArray2.append((Int)(arc4random() % 5 ))
            dataArray3.append((Int)(arc4random() % 5 ))
        }
        
        pickerViewOutlet.delegate = self
        pickerViewOutlet.dataSource = self
        
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
        addBet(1)
        betAmt = 1
    }

    @IBAction func fiveButtonClicked(sender: AnyObject) {
        addBet(5)
        betAmt = 5
    }
    
    @IBAction func tenButtonClicked(sender: AnyObject) {
        addBet(10)
        betAmt = 10
    }
    
    @IBAction func twentyFiveButtonClicked(sender: AnyObject) {
        addBet(25)
        betAmt = 25
    }
    
    @IBAction func allButtonClicked(sender: AnyObject) {
        tempBankAmt = bankAmt
        addBet(tempBankAmt)
        betAmt = tempBankAmt
    }
    
    @IBAction func resetBankButtonClicked(sender: AnyObject) {
        bankAmt = 100
        betAmt = 0
        updateLabel(bankAmt)
    }
    
    @IBAction func resetBetButtonClicked(sender: AnyObject) {
        betAmt = 0
        updateLabel(bankAmt)
        
    }
    
    func addBet(betAmt: Int){
        if betAmt > bankAmt{
            let alertController = UIAlertController(title: "Warning:", message:
                "Not enough to bet", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)

        }
            
        else{
        betAmountLabel.text = "\(betAmt)"
        bankAmountLabel.text = "\(bankAmt - betAmt)"
        
        bankAmt -= betAmt
        }
    }
    
    func updateLabel(bankAmtNew: Int){
        betAmountLabel.text = "0"
        bankAmountLabel.text = "\(bankAmtNew)"
    }
    
    
}

