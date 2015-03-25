//
//  ViewController.swift
//  Swift Savings Visualizer
//
//  Created by John Bura on 9/20/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtYearlyIncome: UITextField!

    @IBOutlet weak var sldPercent: UISlider!
    
    @IBOutlet weak var lblPercentSaved: UILabel!
    @IBOutlet weak var lblWeeklySaved: UILabel!
    @IBOutlet weak var lblMonthlySaved: UILabel!
    @IBOutlet weak var lblYearlySaved: UILabel!
    @IBOutlet weak var lblSaved25Years: UILabel!
    
    var percentVisual : Float = 0
    var yearlyIncome = ""
    var percentSavedDecimal : Float = 0
    var weeklySaved :Float = 0
    var monthlySaved : Float = 0
    var yearlySaved : Float  = 0
    var saved25Years : Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var startingPercent : NSString = NSString(format: "%0.0f", (sldPercent.value * 100))
        lblPercentSaved.text = "\(startingPercent)%"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClear(sender: UIButton) {
        txtYearlyIncome.text = ""
        lblPercentSaved.text = "50%"
        sldPercent.value = 0.5
        lblWeeklySaved.text = "$$$$"
        lblMonthlySaved.text = "$$$$"
        lblYearlySaved.text = "$$$$"
        lblSaved25Years.text = "$$$$"
        
    }

    @IBAction func btnCalculate(sender: UIButton) {
        calculatePercentageSaved()
    }
    
    @IBAction func sldPercentACTION(sender: UISlider) {
        calculatePercentageSaved()
    }
    
    func calculatePercentageSaved() -> Bool{
        yearlyIncome = txtYearlyIncome.text
        percentSavedDecimal = sldPercent.value
        
        var fYearlyIncome = (yearlyIncome as NSString).floatValue
        
        percentVisual = percentSavedDecimal * 100
        
        weeklySaved = (fYearlyIncome / 52) * percentSavedDecimal
        monthlySaved = (fYearlyIncome / 12) * percentSavedDecimal
        yearlySaved = fYearlyIncome * percentSavedDecimal
        saved25Years = (fYearlyIncome * 25) * percentSavedDecimal
        
        var formatPercentSaved : NSString = NSString(format: "%0.0f", percentVisual)
        var formatPercentWeekly : NSString = NSString(format: "%0.0f", weeklySaved)
        var formatPercentMonthly : NSString = NSString(format: "%0.0f", monthlySaved)
        var formatPercentYearly : NSString = NSString(format: "%0.0f", yearlySaved)
        var formatPercent25Years : NSString = NSString(format: "%0.0f", saved25Years)
        
        lblPercentSaved.text = "\(formatPercentSaved)%"
        lblWeeklySaved.text = "$\(formatPercentWeekly)"
        lblMonthlySaved.text = "$\(formatPercentMonthly)"
        lblYearlySaved.text = "$\(formatPercentYearly)"
        lblSaved25Years.text = "$\(formatPercent25Years)"
        
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtYearlyIncome.resignFirstResponder()
    }
}

