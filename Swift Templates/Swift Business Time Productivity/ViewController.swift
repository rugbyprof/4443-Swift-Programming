//
//  ViewController.swift
//  Swift Business Time Productivity
//
//  Created by John Bura on 9/22/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtYearlyDaysWorked: UITextField!
    @IBOutlet weak var txtHoursWorkedPerWeek: UITextField!
    @IBOutlet weak var txtPerecentOfTimeProducing: UITextField!
    @IBOutlet weak var txtYearlyIncome: UITextField!
    @IBOutlet weak var txtYearlyExpenses: UITextField!
    
    @IBOutlet weak var lblPercentOfTimeSelling: UILabel!
    @IBOutlet weak var lblNetIncome: UILabel!
    @IBOutlet weak var lblHourlyIncome: UILabel!
    @IBOutlet weak var lblWeeklyIncome: UILabel!
    @IBOutlet weak var lblMonthlyIncome: UILabel!
    @IBOutlet weak var lblPercentProducing: UILabel!
    @IBOutlet weak var lblPercentSelling: UILabel!
    
    var yearlyDaysWorked = ""
    var hoursWorkedPerWeek = ""
    var percentOfTimeProducing = ""
    var yearlyIncome = ""
    var yearlyExpenses = ""
    
    var percentOfTimeSelling : Float = 0
    var netIncome : Float = 0
    var hourlyIncome : Float = 0
    var weeklyIncome : Float = 0
    var monthlyIncome : Float = 0
    var percentProducing : Float = 0
    var percentSelling : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup afding the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCalculate(sender: UIButton) {
        calculate()
    }
    
    @IBAction func btnClear(sender: UIButton) {
        txtHoursWorkedPerWeek.text = ""
        txtPerecentOfTimeProducing.text = ""
        txtYearlyDaysWorked.text = ""
        txtYearlyExpenses.text = ""
        txtYearlyIncome.text = ""
        
        lblPercentOfTimeSelling.text = "Percent of Time Selling"
        lblNetIncome.text = "Net Income"
        lblHourlyIncome.text = "Hourly Income"
        lblWeeklyIncome.text = "Weekly Income"
        lblMonthlyIncome.text = "Monthly Income"
        lblPercentProducing.text = "Percent Producing"
        lblPercentSelling.text = "Percent Selling"
    }
    
    func calculate() -> Bool{
        yearlyDaysWorked = txtYearlyDaysWorked.text
        hoursWorkedPerWeek = txtHoursWorkedPerWeek.text
        percentOfTimeProducing = txtPerecentOfTimeProducing.text
        yearlyIncome = txtYearlyIncome.text
        yearlyExpenses = txtYearlyExpenses.text
        
        var fYearlyDaysWorked = (yearlyDaysWorked as NSString).floatValue
        var fHoursWorkedPerWeek = (hoursWorkedPerWeek as NSString).floatValue
        var fPercentOfTimeProducing = (percentOfTimeProducing as NSString).floatValue
        var fYearlyIncome = (yearlyIncome as NSString).floatValue
        var fYearlyExpenses = (yearlyExpenses as NSString).floatValue
        
        netIncome = fYearlyIncome - fYearlyExpenses
        hourlyIncome = netIncome / 52 / fHoursWorkedPerWeek
        weeklyIncome = hourlyIncome * fHoursWorkedPerWeek
        monthlyIncome = weeklyIncome * 4
        
        percentSelling = fPercentOfTimeProducing * 2

        
        var formatNetIncome : NSString = NSString(format: "%0.0f", netIncome)
        var formatHourlyIncome : NSString = NSString(format: "%0.0f", hourlyIncome)
        var formatWeeklyIncome : NSString = NSString(format: "%0.0f", weeklyIncome)
        var formatMonthlyIncome : NSString = NSString(format: "%0.0f", monthlyIncome)
        var formatPercentSelling : NSString = NSString(format: "%0.0f", percentSelling)
        var formatPercentTimeProducing : NSString = NSString(format: "%0.0f", fPercentOfTimeProducing)
        
        lblPercentOfTimeSelling.text = "Percent Selling: \(formatPercentSelling) %"
        lblNetIncome.text  = "Net Income: $\(formatNetIncome)"
        lblHourlyIncome.text = "Hourly Income: $\(formatHourlyIncome)"
        lblWeeklyIncome.text = "Weekly Income: $\(formatWeeklyIncome)"
        lblMonthlyIncome.text = "Monthly Income: $\(formatMonthlyIncome)"
        lblPercentProducing.text = "Percent Producing: \(formatPercentTimeProducing)%"
        lblPercentSelling.text = "Percent Selling \(formatPercentSelling)"
        
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtHoursWorkedPerWeek.resignFirstResponder()
        txtPerecentOfTimeProducing.resignFirstResponder()
        txtYearlyDaysWorked.resignFirstResponder()
        txtYearlyExpenses.resignFirstResponder()
        txtYearlyIncome.resignFirstResponder()
    }

}

