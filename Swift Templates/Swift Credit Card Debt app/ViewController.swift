//
//  ViewController.swift
//  Swift Credit Card Debt app
//
//  Created by John Bura on 9/21/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtCreditCardBill: UITextField!
    @IBOutlet weak var txtMonthlyPayment: UITextField!
    @IBOutlet weak var txtMonthlyFees: UITextField!
    @IBOutlet weak var txtInterestRate: UITextField!
    
    @IBOutlet weak var lblTotalFees: UILabel!
    @IBOutlet weak var lblTotalInterest: UILabel!
    @IBOutlet weak var lblTotalPayment: UILabel!
    @IBOutlet weak var lblMonthsTopPayOff: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    var creditCardBill = ""
    var monthlyPayment = ""
    var monthlyFees = ""
    var interestRate = ""
    
    var totalFees : Float = 0
    var totalInterest : Float = 0
    var totalPayments : Float = 0
    var totalMonths : Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnClear(sender: UIButton) {
        lblMessage.textColor = UIColor.blackColor()
        
        txtCreditCardBill.text = ""
        txtInterestRate.text = ""
        txtMonthlyFees.text = ""
        txtMonthlyPayment.text = ""
        
        lblTotalFees.text = "$$$$"
        lblTotalInterest.text  = "$$$$"
        lblTotalPayment.text = "$$$$"
        lblMonthsTopPayOff.text = "Months"
        
        lblMessage.text = "Can you pay off your Credit Card?"
        
        
    }

    @IBAction func btnCalculate(sender: UIButton) {
        
        calculateCreditCardDebt()
    }
    
    func calculateCreditCardDebt() -> Bool{
        creditCardBill = txtCreditCardBill.text
        monthlyPayment = txtMonthlyPayment.text
        monthlyFees = txtMonthlyFees.text
        interestRate = txtInterestRate.text
        
        var fCreditCardBill = (creditCardBill as NSString).floatValue
        var fMonthlyPayment = (monthlyPayment as NSString).floatValue
        var fMonthlyFees = (monthlyFees as NSString).floatValue
        var fInterestRate = (interestRate as NSString).floatValue
        
        var moneyInitial : Float = fCreditCardBill
        var totalFees : Float = 0
        
        lblMessage.textColor = UIColor.blackColor()
        
        if fCreditCardBill >= 0{
            
            for (var i: Float = 0; i <= (fCreditCardBill + fMonthlyPayment); i++){
                 fCreditCardBill = (fCreditCardBill * ((fInterestRate / 100 + 1)) - fMonthlyPayment)
                totalFees = fMonthlyFees * i
                totalInterest = totalInterest + (fCreditCardBill * (fInterestRate / 100))
                totalPayments = totalPayments + fMonthlyFees
                
                var formatI : NSString = NSString(format: "%0.0f", i)
                var formatTotalFees : NSString = NSString(format: "%0.0f", totalFees)
                var formatTotalInterest  : NSString = NSString(format: "%0.0f", totalInterest)
                var formatTotalPayment : NSString = NSString(format: "%0.0f", totalPayments)
                
                lblTotalFees.text = "$\(formatTotalFees)"
                lblMonthsTopPayOff.text = "\(i)"
                lblTotalInterest.text = "$\(formatTotalInterest)"
                lblTotalPayment.text = "$\(formatTotalPayment)"
                lblMessage.text = "You can pay off your credit card!"
                
                if fCreditCardBill >= moneyInitial{
                    lblMessage.text = "More money needed to pay off the card"
                    lblMessage.textColor = UIColor.redColor()
                    
                    break
                }
            }
            
            
            
        }
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtMonthlyPayment.resignFirstResponder()
        txtMonthlyFees.resignFirstResponder()
        txtInterestRate.resignFirstResponder()
        txtCreditCardBill.resignFirstResponder()
    }

}

