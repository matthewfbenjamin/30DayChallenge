//
//  ViewController.swift
//  19 - TipApp
//
//  Created by Matthew Benjamin on 9/7/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var perctSliderBar: UISlider!
    @IBOutlet weak var sliderValLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    var perctTip: Float = 20.0
    var tipTotal: Float?
    var finalCost: Float?
    var billTotal: Float?
    
    var newPerctTip: Float = 20.0
    var percentTipLabel: Int = 20
    
    @IBOutlet weak var resultsTableView: UITableView!

    
    var percentArray:[Float] = []
    var tipArray:[Float] = []
    var totalArray: [Float] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sliderValueChange(sender: UISlider) {
        perctTip = Float(sender.value)
        newPerctTip = round(perctTip)
        percentTipLabel = Int(newPerctTip)
        
        sliderValLabel.text = "\(percentTipLabel)"
    }
    
    @IBAction func calculateButtonClicked(sender: AnyObject) {
        percentArray.append(newPerctTip)
    
        billTotal = Float(priceTextField.text!)
        
        if let bTotal = billTotal {
            
            var bTotalNew = round(bTotal*100)/100
            tipTotal = bTotalNew * newPerctTip/100
            
            if let tTotal = tipTotal{
                var tTotalNew = round(tTotal*100)/100
                tipArray.append(tTotalNew)
                finalCost = tTotal + bTotal
                
                if let fCost = finalCost {
                    var fCostNew = round(fCost*100)/100
                    totalArray.append(fCostNew)
//                    print(percentArray)
//                    print(tipArray)
//                    print(totalArray)
                    self.resultsTableView.reloadData()
                }
            }
        }
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ResultsTableViewCell
        var actualPercent = round(percentArray[indexPath.row])
        var tipPercent = tipArray[indexPath.row]
        var totalAmount = totalArray[indexPath.row]
        
        cell.cellPercentLabel.text = String("\(actualPercent)%")
        cell.cellTipAmountLabel.text = String("$\(tipPercent)")
        cell.cellTotalAmountLabel.text = String("$\(totalAmount)")
        return cell
    }

}

