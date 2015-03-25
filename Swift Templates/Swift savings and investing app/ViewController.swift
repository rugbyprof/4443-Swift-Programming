//
//  ViewController.swift
//  Swift savings and investing app
//
//  Created by John Bura on 9/20/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtYearlyIncome: UITextField!
    @IBOutlet weak var txtWeeklySaved: UITextField!
    
    @IBOutlet weak var lblWeeklySavings: UILabel!
    @IBOutlet weak var lblMonthlySavings: UILabel!
    @IBOutlet weak var lblYearlySavings: UILabel!
    
    @IBOutlet weak var lblMonthlySaved: UILabel!
    @IBOutlet weak var lblYearlySaved: UILabel!
    @IBOutlet weak var lbl5Years: UILabel!
    @IBOutlet weak var lbl10Years: UILabel!
    @IBOutlet weak var lbl20Years: UILabel!
    @IBOutlet weak var lbl30years: UILabel!
    
    @IBOutlet weak var segPercent: UISegmentedControl!
    
    var yearlyIncome = ""
    var weeklySavings = ""
    
    var monthlySavings : Float = 0
    var YearlySavings : Float = 0
    
    var monthlySaved : Float = 0
    var yearlySaved : Float = 0
    var saved5Years : Float = 0
    var saved10Years : Float = 0
    var saved20Years : Float = 0
    var saved30Years : Float = 0
    
    var investmentPercent : Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClear(sender: UIButton) {
        txtYearlyIncome.text = ""
        txtWeeklySaved.text = ""
        
        lbl10Years.text = "$$$$"
        lbl20Years.text = "$$$$"
        lbl30years.text = "$$$$"
        lbl5Years.text = "$$$$"
        
        lblMonthlySaved.text = "$$$$"
        lblMonthlySavings.text = "$$$$"
        lblWeeklySavings.text = "$$$$"
        lblYearlySaved.text = "$$$$"
        lblYearlySavings.text = "$$$$"
        
        segPercent.selectedSegmentIndex = 0

        
    }
    
    @IBAction func btnCalculate(sender: UIButton) {
        calculateSavings()
    }

    @IBAction func segPercentACTION(sender: AnyObject) {
        calculateSavings()
        
        txtWeeklySaved.resignFirstResponder()
        txtYearlyIncome.resignFirstResponder()
    }
    
    func calculateSavings() -> Bool{
        yearlyIncome = txtYearlyIncome.text
        weeklySavings = txtWeeklySaved.text
        
        var fYearlyIncome = (yearlyIncome as NSString).floatValue
        var fWeeklySavings = (weeklySavings as NSString).floatValue
        
        monthlySavings = fWeeklySavings * 4
        YearlySavings = monthlySavings * 12
        
        if segPercent.selectedSegmentIndex == 0 {
            investmentPercent = 1.05
        }
        if segPercent.selectedSegmentIndex == 1 {
            investmentPercent = 1.10
        }
        if segPercent.selectedSegmentIndex == 2 {
            investmentPercent = 1.15
        }
        if segPercent.selectedSegmentIndex == 3 {
            investmentPercent = 1.20
        }
        if segPercent.selectedSegmentIndex == 4 {
            investmentPercent = 1.25
        }
        
        monthlySaved = (fYearlyIncome * investmentPercent) / 12
        yearlySaved = fYearlyIncome * investmentPercent
        saved5Years = yearlySaved * 5
        saved10Years = yearlySaved * 10
        saved20Years = yearlySaved * 20
        saved30Years = yearlySaved * 30
        
        var formatWeeklySavings : NSString = NSString(format: "%0.0f", fWeeklySavings)
        var formatMonthlySavings : NSString = NSString(format: "%0.0f", monthlySavings)
        var formatYearlySavings : NSString = NSString(format: "%0.0f", YearlySavings)
        var formatMonthlySaved : NSString = NSString(format: "%0.0f", monthlySaved)
        var formatYearlySaved : NSString = NSString(format: "%0.0f", yearlySaved)
        var formatSaved5Years : NSString = NSString(format: "%0.0f", saved5Years)
        var formatSaved10Years : NSString = NSString(format: "%0.0f", saved10Years)
        var formatSaved20Years : NSString = NSString(format: "%0.0f", saved20Years)
        var formatSaved30Years : NSString = NSString(format: "%0.0f", saved30Years)
        
        lblWeeklySavings.text = "$\(formatWeeklySavings)"
        lblMonthlySavings.text = "$\(formatMonthlySavings)"
        lblYearlySavings.text = "$\(formatYearlySavings)"
        
        lblMonthlySaved.text = "$\(formatMonthlySaved)"
        lblYearlySaved.text = "$\(formatYearlySaved)"
        lbl5Years.text = "$\(formatSaved5Years)"
        lbl10Years.text = "$\(formatSaved10Years)"
        lbl20Years.text = "$\(formatSaved20Years)"
        lbl30years.text = "$\(formatSaved30Years)"
        
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtWeeklySaved.resignFirstResponder()
        txtYearlyIncome.resignFirstResponder()
    }

}

