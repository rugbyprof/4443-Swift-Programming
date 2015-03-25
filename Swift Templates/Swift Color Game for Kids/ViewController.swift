//
//  ViewController.swift
//  Swift Color Game for Kids
//
//  Created by John Bura on 9/25/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblChangeColor: UILabel!
    
    @IBOutlet weak var lblTotalCorrect: UILabel!
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    @IBOutlet weak var btnAnswer1OUTLET: UIButton!
    @IBOutlet weak var btnAnswer2OUTLET: UIButton!
    @IBOutlet weak var btnAnswer3OUTLET: UIButton!
    
    
    var buttonAnswer = 0
    
    var colorNumber = 0
    
    var colorType : [String] = ["Red", "Green", "Blue", "Orange", "Black", "White", "Brown", "Purple", "Grey", "Yellow", "Pink", "Magenta"]
    
    var button0Correct = false
    var button1Correct = false
    var button2Correct = false
    
    var totalCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchColorLogic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAnswer1(sender: UIButton) {
        if button0Correct == true{
            lblCorrectIncorrect.text = "Correct!"
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
            
        }
        else{
            lblCorrectIncorrect.text = "Incorrect"
        }
        
        button0Correct = false
        matchColorLogic()
    }
    
    @IBAction func btnAnswer2(sender: UIButton) {
        if button1Correct == true{
            lblCorrectIncorrect.text = "Correct!"
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
            
        }
        else{
            lblCorrectIncorrect.text = "Incorrect"
        }
        
        button1Correct = false
        matchColorLogic()
    }
    
    @IBAction func btnAnswer3(sender: UIButton) {
        if button2Correct == true{
            lblCorrectIncorrect.text = "Correct!"
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
            
        }
        else{
            lblCorrectIncorrect.text = "Incorrect"
        }
        
        button2Correct = false
        matchColorLogic()
    }
    
    func matchColorLogic() -> Bool{
        buttonAnswer = Int(arc4random_uniform(2))
        colorNumber = Int(arc4random_uniform(9))
        
        changeColor()
        
        if buttonAnswer == 0{
            button0Correct = true
            
            btnAnswer1OUTLET.setTitle(colorType[colorNumber], forState: UIControlState.Normal)
            
             btnAnswer2OUTLET.setTitle(colorType[colorNumber + 1], forState: UIControlState.Normal)
             btnAnswer3OUTLET.setTitle(colorType[colorNumber + 2], forState: UIControlState.Normal)
        }
        
        if buttonAnswer == 1 {
            
            button1Correct = true
             btnAnswer2OUTLET.setTitle(colorType[colorNumber], forState: UIControlState.Normal)
            
            btnAnswer1OUTLET.setTitle(colorType[colorNumber + 1], forState: UIControlState.Normal)
            btnAnswer3OUTLET.setTitle(colorType[colorNumber + 2], forState: UIControlState.Normal)
            
        }
        
        if buttonAnswer == 2{
            button2Correct = true
             btnAnswer3OUTLET.setTitle(colorType[colorNumber], forState: UIControlState.Normal)
            
            btnAnswer2OUTLET.setTitle(colorType[colorNumber + 1], forState: UIControlState.Normal)
            btnAnswer1OUTLET.setTitle(colorType[colorNumber + 2], forState: UIControlState.Normal)
        }
        
        
        return true
    }
    
    
    
    func changeColor() -> Bool{
        
        if colorNumber == 0{
            lblChangeColor.backgroundColor = UIColor.redColor()
        }
        if colorNumber == 1{
            lblChangeColor.backgroundColor = UIColor.greenColor()
        }
        if colorNumber == 2{
            lblChangeColor.backgroundColor = UIColor.blueColor()
        }
        if colorNumber == 3{
            lblChangeColor.backgroundColor = UIColor.orangeColor()
        }
        if colorNumber == 4{
            lblChangeColor.backgroundColor = UIColor.blackColor()
        }
        if colorNumber == 5{
            lblChangeColor.backgroundColor = UIColor.whiteColor()
        }
        if colorNumber == 6{
            lblChangeColor.backgroundColor = UIColor.brownColor()
        }
        if colorNumber == 7{
            lblChangeColor.backgroundColor = UIColor.purpleColor()
        }
        if colorNumber == 8{
            lblChangeColor.backgroundColor = UIColor.grayColor()
        }
        if colorNumber == 9{
            lblChangeColor.backgroundColor = UIColor.yellowColor()
        }

        return true
    }

}

