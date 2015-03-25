//
//  ViewController.swift
//  Swift Tax Calculator
//
//  Created by John Bura on 9/21/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtYearlyIncome: UITextField!
    
    @IBOutlet weak var lblTaxPercentage: UILabel!
    @IBOutlet weak var lblWeeklyTax: UILabel!
    @IBOutlet weak var lblMonthlyTax: UILabel!
    @IBOutlet weak var lblQuarterlyTax: UILabel!
    @IBOutlet weak var lblYearlyTax: UILabel!
    
    @IBOutlet weak var lblAfterTaxWeekly: UILabel!
    @IBOutlet weak var lblAfterTaxMonthly: UILabel!
    @IBOutlet weak var lblAfterTaxQuarterly: UILabel!
    @IBOutlet weak var lblAfterTaxYearly: UILabel!
    
    @IBOutlet weak var sldSlider: UISlider!
    
    
    var yearlyIncome = ""
    var taxPercentage : Float = 0
    var taxPercentagePrint : Float
    
    var weeklyTax : Float = 0
    var monthlyTax : Float = 0
    var quarterlyTax : Float = 0
    var yearlyTax : Float = 0
    
    var afterTaxWeekly : Float = 0
    var afterTaxMonthly : Float = 0
    var afterTaxQuarterly : Float = 0
    var afterTaxYearly : Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       lblTaxPercentage.text = "\(sldSlider.value * 100)%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClear(sender: UIButton) {
        txtYearlyIncome.text = ""
        sldSlider.value = 0.25
        lblTaxPercentage.text = "\(sldSlider.value * 100)%"
        lblWeeklyTax.text = "$$$$"
        lblMonthlyTax.text = "$$$$"
        lblQuarterlyTax.text = "$$$$"
        lblYearlyTax.text = "$$$$"
        lblAfterTaxWeekly.text = "$$$$"
        lblAfterTaxMonthly.text = "$$$$"
        lblAfterTaxQuarterly.text = "$$$$"
        lblAfterTaxYearly.text = "$$$$"
    }

    @IBAction func btnCalculate(sender: UIButton) {
        calculateTax()
    }
    
    @IBAction func sldSliderACTION(sender: UISlider) {
        calculateTax()
        //
    }
    
    
    func calculateTax() ->Bool{
        
        yearlyIncome = txtYearlyIncome.text
        
        var fYearlyIncome = (yearlyIncome as NSString).floatValue
        
        taxPercentage = sldSlider.value
        taxPercentagePrint = sldSlider.value * 100

        
        weeklyTax = fYearlyIncome / 52 * taxPercentage
        monthlyTax = fYearlyIncome / 12 * taxPercentage
        quarterlyTax = fYearlyIncome / 4 * taxPercentage
        yearlyTax = fYearlyIncome * taxPercentage
        
        afterTaxWeekly = fYearlyIncome / 52 - weeklyTax
        afterTaxMonthly = fYearlyIncome / 12 - monthlyTax
        afterTaxQuarterly = fYearlyIncome / 4 - quarterlyTax
        afterTaxYearly = fYearlyIncome - yearlyTax
        
        var formatWeekly : NSString = NSString(format: "%0.0f", weeklyTax)
        var formatMonthly : NSString = NSString(format: "%0.0f", monthlyTax)
        var formatQuarterly : NSString = NSString(format: "%0.0f", quarterlyTax)
        var formatYearly : NSString = NSString(format: "%0.0f", yearlyTax)
        
        var formatAfterWeekly : NSString = NSString(format: "%0.0f", afterTaxWeekly)
        var formatAfterMonthly : NSString = NSString(format: "%0.0f", afterTaxMonthly)
        var formatAfterQuarterly : NSString = NSString(format: "%0.0f", afterTaxQuarterly)
        var formatAfterYearly : NSString = NSString(format: "%0.0f", afterTaxYearly)
        
        lblWeeklyTax.text = "$\(formatWeekly)"
        lblMonthlyTax.text = "$\(formatMonthly)"
        lblQuarterlyTax.text = "$\(formatQuarterly)"
        lblYearlyTax.text = "$\(formatYearly)"
        
        lblAfterTaxWeekly.text = "$\(formatAfterWeekly)"
        lblAfterTaxMonthly.text = "$\(formatAfterMonthly)"
        lblAfterTaxQuarterly.text = "$\(formatAfterQuarterly)"
        lblAfterTaxYearly.text = "$\(formatAfterYearly)"
        
        lblTaxPercentage.text = "\(taxPercentagePrint)%"
        
        return true
    }
}
