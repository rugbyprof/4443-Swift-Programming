//
//  ViewController.swift
//  Swift Compound Interest Calcualtor
//
//  Created by John Bura on 9/19/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtPrincipal: UITextField!
    @IBOutlet weak var txtRate: UITextField!
    @IBOutlet weak var txtCompoundPerYear: UITextField!
    @IBOutlet weak var txtYears: UITextField!
    
    @IBOutlet weak var lblAnswer: UILabel!
    
    var principal = ""
    var rate = ""
    var compoundPerYear = ""
    var years = ""
    
    var answer : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClear(sender: UIButton) {
        txtCompoundPerYear.text = ""
        txtPrincipal.text = ""
        txtRate.text = ""
        txtYears.text = ""
        
        lblAnswer.text = "Answer"
        
    }

    @IBAction func btnCalculate(sender: UIButton) {
        calculateInterest()
    }
    
    func calculateInterest()-> Bool {
        
        principal = txtPrincipal.text
        rate = txtRate.text
        compoundPerYear = txtCompoundPerYear.text
        years = txtYears.text
        
        var fPrincipal = (principal as NSString).floatValue
        var fRate = (principal as NSString).floatValue
        var fCompoundPerYear = (compoundPerYear as NSString).floatValue
        var fYears = (years as NSString).floatValue
        
        answer = powf((1+((fRate / 100) / fCompoundPerYear)), (fCompoundPerYear * fYears))

        var answerFormat : NSString = NSString(format: "%0.0f", answer)
        
        lblAnswer.text = "\(answerFormat)"
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtYears.resignFirstResponder()
        txtCompoundPerYear.resignFirstResponder()
        txtPrincipal.resignFirstResponder()
        txtRate.resignFirstResponder()
    }
}

