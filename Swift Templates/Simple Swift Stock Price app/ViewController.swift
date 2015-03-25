//
//  ViewController.swift
//  Simple Swift Stock Price app
//
//  Created by John Bura on 9/19/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var txtOriginalPrice: UITextField!
    @IBOutlet weak var txtAmountBought: UITextField!
    @IBOutlet weak var txtSellingPrice: UITextField!
    
    @IBOutlet weak var lblPercent: UILabel!
    @IBOutlet weak var lblProfit: UILabel!
    
    var originalPrice = ""
    var amountBought = ""
    var sellingPrice = ""
    
    var percentIncrease : Float = 0
    var profit : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCalculate(sender: UIButton) {
        calculateTheProfit()
        
    }

    @IBAction func btnClear(sender: UIButton) {
        txtAmountBought.text = ""
        txtOriginalPrice.text = ""
        txtSellingPrice.text = ""
        
        lblPercent.text = "Percent Increase"
        lblProfit.text = "Profit"
    }
    
    func calculateTheProfit() -> Bool{
        originalPrice = txtOriginalPrice.text
        amountBought = txtAmountBought.text
        sellingPrice = txtSellingPrice.text
        
        var fOriginalPrice = (originalPrice as NSString).floatValue
        var fAmountBought = (amountBought as NSString).floatValue
        var fSellingPrice = (sellingPrice as NSString).floatValue
        
        percentIncrease = fSellingPrice / fOriginalPrice - 1
        profit = (fSellingPrice * fAmountBought) - (fOriginalPrice * fAmountBought)
        
        var answerPercent : NSString = NSString(format: "%0.2f", percentIncrease)
        var answerProfit : NSString = NSString(format: "%0.2f", profit)
        
        lblPercent.text = String(answerPercent)
        lblProfit.text = String(answerProfit)
        
        
        return true
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtAmountBought.resignFirstResponder()
        txtOriginalPrice.resignFirstResponder()
        txtSellingPrice.resignFirstResponder()
    }

}

