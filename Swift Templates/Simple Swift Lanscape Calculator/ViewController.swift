//
//  ViewController.swift
//  Simple Swift Lanscape Calculator
//
//  Created by John Bura on 9/19/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var txtAdditionFirstNumber: UITextField!
    @IBOutlet weak var txtSubtractionFirstNumber: UITextField!
    @IBOutlet weak var txtMultiplicationFirstNumber: UITextField!
    @IBOutlet weak var txtDivisionFirstNumber: UITextField!
    
    @IBOutlet weak var txtAdditionSecondNumber: UITextField!
    @IBOutlet weak var txtSubtractionSecondNumber: UITextField!
    @IBOutlet weak var txtMultiplicationSecondNumber: UITextField!
    @IBOutlet weak var txtDivisionSecondNumber: UITextField!
    
    @IBOutlet weak var lblAdditionAnswer: UILabel!
    @IBOutlet weak var lblSubtractionAnswer: UILabel!
    @IBOutlet weak var lblMultiplicationAnswer: UILabel!
    @IBOutlet weak var lblDivisionAnswer: UILabel!
    
    var additionFirstNumber = ""
    var additionSecondNumber = ""
    var additionAnswer : Float = 0
    
    var subtractionFirstNumber = ""
    var subtractionSecondNumber = ""
    var subtractionAnswer : Float = 0
    
    var multiplicationFirstNumber = ""
    var multiplicationSecondNumber = ""
    var multiplicationAnswer : Float = 0
    
    var divisionFirstNumber = ""
    var divisionSecondNumber = ""
    var divisionAnswer : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClear(sender: UIButton) {
        txtAdditionFirstNumber.text = ""
        txtAdditionSecondNumber.text = ""
        txtDivisionFirstNumber.text = ""
        txtDivisionSecondNumber.text = ""
        txtMultiplicationFirstNumber.text = ""
        txtMultiplicationSecondNumber.text = ""
        txtSubtractionFirstNumber.text = ""
        txtSubtractionSecondNumber.text = ""
        
        lblAdditionAnswer.text = "Answer"
        lblDivisionAnswer.text = "Answer"
        lblMultiplicationAnswer.text = "Answer"
        lblSubtractionAnswer.text = "Answer"
    }

    @IBAction func btnCalculate(sender: UIButton) {
        additionCalculation()
        subtractionCalculation()
        multiplicationCalculation()
        divisionCalculation()
    }
    
    func additionCalculation() -> Bool{
        additionFirstNumber = txtAdditionFirstNumber.text
        additionSecondNumber = txtAdditionSecondNumber.text
        
        var firstNumber = (additionFirstNumber as NSString).floatValue
        var secondNumber = (additionSecondNumber as NSString).floatValue
    
        additionAnswer = firstNumber + secondNumber
        
        var answerFormat : NSString = NSString(format: "%0.0f", additionAnswer)
        
        lblAdditionAnswer.text = String(answerFormat)
        
        return true
    }
    
    func subtractionCalculation() -> Bool{
        subtractionFirstNumber = txtSubtractionFirstNumber.text
        subtractionSecondNumber = txtSubtractionSecondNumber.text
        
        var firstNumber = (subtractionFirstNumber as NSString).floatValue
        var secondNumber = (subtractionSecondNumber as NSString).floatValue
        
        subtractionAnswer = firstNumber - secondNumber
        
        var answerFormat : NSString = NSString(format: "%0.0f", subtractionAnswer)
        
        lblSubtractionAnswer.text = String(answerFormat)
        
        return true
    }
    
    func multiplicationCalculation() -> Bool{
        multiplicationFirstNumber = txtMultiplicationFirstNumber.text
        multiplicationSecondNumber = txtMultiplicationSecondNumber.text
        
        var firstNumber = (multiplicationFirstNumber as NSString).floatValue
        var secondNumber = (multiplicationSecondNumber as NSString).floatValue
        
        multiplicationAnswer = firstNumber * secondNumber
        
        var answerFormat : NSString = NSString(format: "%0.0f", multiplicationAnswer)
        
        lblMultiplicationAnswer.text = String(answerFormat)
        
        return true
    }
    
    func divisionCalculation() -> Bool {
        divisionFirstNumber = txtDivisionFirstNumber.text
        divisionSecondNumber = txtDivisionSecondNumber.text
        
        var firstNumber = (divisionFirstNumber as NSString).floatValue
        var secondNumber = (divisionSecondNumber as NSString).floatValue
        
        divisionAnswer = firstNumber / secondNumber
        
        var answerFormat : NSString = NSString(format: "%0.2f", divisionAnswer)
        
        lblDivisionAnswer.text = String(answerFormat)
        
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        txtAdditionFirstNumber.resignFirstResponder()
        txtAdditionSecondNumber.resignFirstResponder()
        txtDivisionFirstNumber.resignFirstResponder()
        txtDivisionSecondNumber.resignFirstResponder()
        txtMultiplicationFirstNumber.resignFirstResponder()
        txtMultiplicationSecondNumber.resignFirstResponder()
        txtSubtractionFirstNumber.resignFirstResponder()
        txtSubtractionSecondNumber.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtAdditionFirstNumber.resignFirstResponder()
        txtAdditionSecondNumber.resignFirstResponder()
        txtDivisionFirstNumber.resignFirstResponder()
        txtDivisionSecondNumber.resignFirstResponder()
        txtMultiplicationFirstNumber.resignFirstResponder()
        txtMultiplicationSecondNumber.resignFirstResponder()
        txtSubtractionFirstNumber.resignFirstResponder()
        txtSubtractionSecondNumber.resignFirstResponder()
    }
}

