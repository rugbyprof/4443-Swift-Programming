//
//  ViewController.swift
//  Swift Savings app
//
//  Created by John Bura on 9/26/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtYearlyIncome: UITextField!
    @IBOutlet weak var txtMonthlyRent: UITextField!
    @IBOutlet weak var txtFoodBill: UITextField!
    @IBOutlet weak var txtEntertainment: UITextField!
    @IBOutlet weak var txtExpenses: UITextField!
    @IBOutlet weak var txtSavings: UITextField!
    
    @IBOutlet weak var lblIncomeSpent: UILabel!
    @IBOutlet weak var lblYearlyExpenses: UILabel!
    @IBOutlet weak var lblYearlySavings: UILabel!
    
    
    @IBOutlet weak var sldExpenses: UISlider!
    @IBOutlet weak var sldSavings: UISlider!
    
    var yearlyIncome = ""
    var monthlyRent = ""
    var foodBill = ""
    var entertainment = ""
    var monthlyExpenses = ""
    var monthlySavings = ""
    
    var incomeSpent : Float = 0
    var sliderExpenses : Float = 0
    var sliderSavings : Float = 0
    var totalYearlyExpenses : Float = 0
    var totalYearlySavings : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClear(sender: UIButton) {
        txtEntertainment.text = ""
        txtExpenses.text = ""
        txtFoodBill.text = ""
        txtMonthlyRent.text = ""
        txtSavings.text = ""
        
        lblIncomeSpent.text = "%"
        lblYearlyExpenses.text = "$$$$"
        lblYearlySavings.text = "$$$$"
        
    }

    @IBAction func btnCalculate(sender: UIButton) {
        calculateSavings()
    }
    
    @IBAction func sldExpensesACTION(sender: UISlider) {
        sliderExpenses = sldExpenses.value
        calculateSavings()
        
    }
    @IBAction func sldSavingsACTION(sender: UISlider) {
        sliderSavings = sldSavings.value
        calculateSavings()
    }
    
    func calculateSavings() -> Bool{
        yearlyIncome = txtYearlyIncome.text
        monthlyRent = txtMonthlyRent.text
        foodBill = txtFoodBill.text
        entertainment = txtEntertainment.text
        monthlyExpenses = txtExpenses.text
        monthlySavings = txtSavings.text
        
        sliderExpenses = sldExpenses.value
        sliderSavings = sldSavings.value
        
        var fYearlyIncome = (yearlyIncome as NSString).floatValue
        var fMonthlyRent = (monthlyRent as NSString).floatValue
        var fFoodBill = (foodBill as NSString).floatValue
        var fEntertainment = (entertainment as NSString).floatValue
        var fMonthlyExpenses = (monthlyExpenses as NSString).floatValue
        var fMonthlySavings = (monthlySavings as NSString).floatValue
        
        var expenses = fMonthlyRent + fFoodBill + fEntertainment + fMonthlyExpenses
        totalYearlyExpenses = (expenses * 12) * sliderExpenses
        var savings = fMonthlySavings * 12
        totalYearlySavings = (fYearlyIncome - totalYearlyExpenses + savings) * sliderSavings
        
        incomeSpent = totalYearlyExpenses / fYearlyIncome * 100
        
        var formatIncomeSpent : NSString = NSString(format: "%0.0f", incomeSpent)
        var formatTotalExpenses : NSString = NSString(format: "%0.0f", totalYearlyExpenses)
        var formatYearlySavings : NSString = NSString(format: "%0.0f", totalYearlySavings)
        
        lblIncomeSpent.text = "\(formatIncomeSpent)%"
        lblYearlyExpenses.text = "$\(formatTotalExpenses)"
        lblYearlySavings.text = "$\(formatYearlySavings)"
        
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtEntertainment.resignFirstResponder()
        txtExpenses.resignFirstResponder()
        txtFoodBill.resignFirstResponder()
        txtMonthlyRent.resignFirstResponder()
        txtSavings.resignFirstResponder()
        txtYearlyIncome.resignFirstResponder()
    }
    
    
}

