//
//  ViewController.swift
//  Swift Algebra Addition Game
//
//  Created by John Bura on 9/29/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber1: UILabel!
    @IBOutlet weak var lblNumber2: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    @IBOutlet weak var lblTotalCorrect: UILabel!
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    @IBOutlet weak var btnAnswer0: UIButton!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    var number1 : Int = 0
    var number2 : Int = 0
    var answer : Int = 0
    
    var totalCorrect = 0
    var buttonAnswer = 0
    var xNumber = 0
    
    var button0Correct = false;
    var button1Correct = false;
    var button2Correct = false;
    var button3Correct = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameLogic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAnswer0ACTION(sender: UIButton) {
        if button0Correct == true{
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correc: \(totalCorrect)"
            lblCorrectIncorrect.text = "Correct!"
        }
        else{
            lblCorrectIncorrect.text = "Incorrect"
        }
        
        button0Correct = false
        
        gameLogic()
    }
    
    @IBAction func btnAnswer1ACTION(sender: UIButton) {
        if button1Correct == true{
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correc: \(totalCorrect)"
            lblCorrectIncorrect.text = "Correct!"
        }
        else{
            lblCorrectIncorrect.text = "Incorrect"
        }
        
        button1Correct = false
        
        gameLogic()
       
        
        
    }
    @IBAction func btnAnswer2ACTION(sender: UIButton) {
        if button2Correct == true{
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correc: \(totalCorrect)"
            lblCorrectIncorrect.text = "Correct!"
        }
        else{
            lblCorrectIncorrect.text = "Incorrect"
        }
        
        button2Correct = false
        
        gameLogic()
    }
    @IBAction func btnAnswer3ACTION(sender: UIButton) {
        
        if button3Correct == true{
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correc: \(totalCorrect)"
            lblCorrectIncorrect.text = "Correct!"
        }
        else{
            lblCorrectIncorrect.text = "Incorrect"
        }
        
        button3Correct = false
        
        gameLogic()
    }

    @IBAction func btnNextQuestion(sender: UIButton) {
        gameLogic()
    }
    
    func gameLogic() -> Bool{
        
        number1 = Int(arc4random_uniform(10))
        number2 = Int(arc4random_uniform(10))
        buttonAnswer = Int(arc4random_uniform(4))
        xNumber = Int(arc4random_uniform(2))
        
        answer = number1 + number2
        
        var incorrectAnswer1 = Int(arc4random_uniform(10))
        var incorrectAnswer2 = Int(arc4random_uniform(10))
        var incorrectAnswer3 = Int(arc4random_uniform(10))
        
        
        if xNumber == 0{
            lblNumber1.text = "x"
            lblNumber2.text = "\(number2)"
            
            if incorrectAnswer1 == number1{
                incorrectAnswer1 = 11
            }
            if incorrectAnswer2 == number1{
                incorrectAnswer2 = 12
            }
            if incorrectAnswer3 == number1{
                incorrectAnswer3 = 13
            }

            if buttonAnswer == 0{
                button0Correct = true
                
                btnAnswer0.setTitle("\(number1)", forState: UIControlState.Normal)
                
                 btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
                 btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
                 btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
            }
            if buttonAnswer == 1{
                button1Correct = true
                
                btnAnswer1.setTitle("\(number1)", forState: UIControlState.Normal)
                
                btnAnswer0.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
                btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
                btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
            }
            if buttonAnswer == 2{
                button2Correct = true
                btnAnswer2.setTitle("\(number1)", forState: UIControlState.Normal)
                
                btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
                btnAnswer0.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
                btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
            }
            if buttonAnswer == 3{
                button3Correct = true
                
                btnAnswer3.setTitle("\(number1)", forState: UIControlState.Normal)
                
                btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
                btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
                btnAnswer0.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
            }
            
        }
        
        if xNumber == 1{
            
            lblNumber2.text = "x"
            lblNumber1.text = "\(number1)"
            
            if incorrectAnswer1 == number2{
                incorrectAnswer1 = 11
            }
            if incorrectAnswer2 == number2{
                incorrectAnswer2 = 12
            }
            if incorrectAnswer3 == number2{
                incorrectAnswer3 = 13
            }
            
            
            if buttonAnswer == 0{
                button0Correct = true
                
                btnAnswer0.setTitle("\(number2)", forState: UIControlState.Normal)
                
                btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
                btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
                btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
            }
            if buttonAnswer == 1{
                button1Correct = true
                
                btnAnswer1.setTitle("\(number2)", forState: UIControlState.Normal)
                
                btnAnswer0.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
                btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
                btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
            }
            if buttonAnswer == 2{
                button2Correct = true
                btnAnswer2.setTitle("\(number2)", forState: UIControlState.Normal)
                
                btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
                btnAnswer0.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
                btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
            }
            if buttonAnswer == 3{
                button3Correct = true
                
                btnAnswer3.setTitle("\(number2)", forState: UIControlState.Normal)
                
                btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
                btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
                btnAnswer0.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
            }

            
        }
        
        lblAnswer.text = "\(answer)"
        
        
        return true;
    }
    
    
}

