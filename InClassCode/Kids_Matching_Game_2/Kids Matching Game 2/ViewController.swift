//
//  ViewController.swift
//  Kids Matching Game 2
//
//  Created by Terry Griffin on 2/2/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//
//
// It never puts the correct choice on button 3? Why?

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgImageViewer: UIImageView!
    
    @IBOutlet weak var btnButtonChoice1: UIButton!
    @IBOutlet weak var btnButtonChoice2: UIButton!
    @IBOutlet weak var btnButtonChoice3: UIButton!
    
    @IBOutlet weak var lblTotalScore: UILabel!
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    var animalArray : [String] = ["bee","cat", "cow", "dog", "elk", "frog", "gorilla","guinea_pig", "hippo", "monkey", "owl", "panda", "penguin", "pig", "shark", "tiger"]
    
    var randomNum = 0               //Random number 0 -> sizeof animal array
    var randomButton = 0            //Random num 1 -> 3
    
    var btn1Correct = false         //Which button is correct?
    var btn2Correct = false
    var btn3Correct = false
    
    var totalScore = 0              //Total number correct choices
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageMatchLogic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnButton1ACTION(sender: UIButton) {
        if btn1Correct == true {
            totalScore++
            lblTotalScore.text = "Total Score: \(totalScore)"
            lblCorrectIncorrect.text = "Correct!!!"
        }else{
            lblCorrectIncorrect.text = "Sorry!!!"
        }
        btn1Correct = false
        imageMatchLogic()
    }
    
    
    @IBAction func btnButton2ACTION(sender: UIButton) {
        if btn2Correct == true {
            totalScore++
            lblTotalScore.text = "Total Score: \(totalScore)"
            lblCorrectIncorrect.text = "Correct!!!"
        }else{
            lblCorrectIncorrect.text = "Sorry!!!"
        }
        btn2Correct = false
        imageMatchLogic()
    }
    
    
    @IBAction func btnButton3ACTION(sender: UIButton) {
        if btn3Correct == true {
            totalScore++
            lblTotalScore.text = "Total Score: \(totalScore)"
            lblCorrectIncorrect.text = "Correct!!!"
        }else{
            lblCorrectIncorrect.text = "Sorry!!!"
        }
        btn3Correct = false
        imageMatchLogic()
    }
    

    func imageMatchLogic() ->  Bool {
        
        randomNum = Int(arc4random()) % animalArray.count
        randomButton = Int(arc4random_uniform(2)) + 1
        
        var animalName = animalArray[randomNum]
        var prevName = animalArray[((randomNum-1) + animalArray.count) % animalArray.count]
        var nextName = animalArray[(randomNum + 1) % animalArray.count]

        
        imgImageViewer.image = UIImage(named:"\(animalName).jpg")
        
        
        if(randomButton == 1){
            btn1Correct = true
            btnButtonChoice1.setTitle(animalName, forState:UIControlState.Normal)
            btnButtonChoice2.setTitle(prevName, forState:UIControlState.Normal)
            btnButtonChoice3.setTitle(nextName, forState:UIControlState.Normal)
            
        }
        
        if(randomButton == 2){
            btn2Correct = true
            btnButtonChoice1.setTitle(prevName, forState:UIControlState.Normal)
            btnButtonChoice2.setTitle(animalName, forState:UIControlState.Normal)
            btnButtonChoice3.setTitle(nextName, forState:UIControlState.Normal)
        }
        
        if(randomButton == 3){
            btn3Correct = true
            btnButtonChoice1.setTitle(nextName, forState:UIControlState.Normal)
            btnButtonChoice2.setTitle(prevName, forState:UIControlState.Normal)
            btnButtonChoice3.setTitle(animalName, forState:UIControlState.Normal)
        }
        
        
        return true
    }
}

