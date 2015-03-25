//
//  ViewController.swift
//  Swift image matching for kids
//
//  Created by John Bura on 9/25/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageImageView: UIImageView!
    
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    
    @IBOutlet weak var lblTotalCorrect: UILabel!
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    var imageNumber = 0
    
    var buttonAnswer = 0
    
    var animalNames : [String] = ["Lady Bug", "Crocodile", "Rabbit", "Cow", "Hippo", "Butterfly", "Dog", "Horse", "Moth", "Cat"]
    
    var button0Correct = false
    var button1Correct = false
    
    var totalCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchImageLogic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be ted.
    }

    @IBAction func btnAnswer1ACTION(sender: UIButton) {
        if button0Correct == true{
            lblCorrectIncorrect.text = "Correct!"
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
            
        }
        else if button0Correct == false {
            lblCorrectIncorrect.text = "Incorrect"
        }
        button0Correct = false
        matchImageLogic()
        
    }

    @IBAction func btnAnswer2ACTION(sender: UIButton) {
        if button1Correct == true{
            lblCorrectIncorrect.text = "Correct!"
            totalCorrect = totalCorrect + 1
            lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
            
        }
        else if button1Correct == false {
            lblCorrectIncorrect.text = "Incorrect"
        }
        button1Correct = false
        matchImageLogic()
    }
    
    func matchImageLogic() -> Bool{
        imageNumber = Int(arc4random_uniform(9))
        buttonAnswer = Int(arc4random_uniform(2))
        
        var image = UIImage(named: "\(imageNumber).jpg")
        imageImageView.image = image
        
        if buttonAnswer == 0 {
            button0Correct = true
            btnAnswer1.setTitle(animalNames[imageNumber], forState: UIControlState.Normal)
            var tempRandomNumber = Int(arc4random_uniform(9))
            
            if tempRandomNumber != imageNumber {
            
                btnAnswer2.setTitle(animalNames[tempRandomNumber], forState: UIControlState.Normal)
            }
            else {
                btnAnswer2.setTitle("Mammoth", forState: UIControlState.Normal)
            }
        }
        if buttonAnswer == 1 {
            button1Correct = true
            btnAnswer2.setTitle(animalNames[imageNumber], forState: UIControlState.Normal)
            
            var tempRandomNumber = Int(arc4random_uniform(9))
            
            if tempRandomNumber != imageNumber {
                
                btnAnswer1.setTitle(animalNames[tempRandomNumber], forState: UIControlState.Normal)
            }
            else {
                btnAnswer1.setTitle("Mammoth", forState: UIControlState.Normal)
            }

        }

        return true
    }
}

