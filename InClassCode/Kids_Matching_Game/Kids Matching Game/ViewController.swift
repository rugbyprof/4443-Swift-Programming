//
//  ViewController.swift
//  Kids Matching Game
//
//  Created by Terry Griffin on 1/29/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageImageViewer: UIImageView!
    
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    
    @IBOutlet weak var lblTotalCorrect: UILabel!
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    var animalNames : [String] = ["bee","cat","cow","dog","elk","frog","gorilla","guinea_pig","hippo","monkey","owl","panda","penguin","pig","shark","tiger"]
    
    var totalCount = 0
    
    var button1Correct = false
    var button2Correct = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //btnAnswer1.setTitle("Frog", forState: UIControlState.Normal)
        
        imageMatchLogic()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnAnswer1Action(sender: AnyObject) {
        
        if button1Correct == true{
            totalCount++
            lblCorrectIncorrect.text = "Correct!!!"
        }else{
            lblCorrectIncorrect.text = "Sorry!!!"
        }
        button1Correct = false
        showTotalCount()
        imageMatchLogic()
        
    }
    
    @IBAction func btnAnswer2Action(sender: AnyObject) {
        if button2Correct == true{
            totalCount++
            lblCorrectIncorrect.text = "Correct!!!"
        }else{
            lblCorrectIncorrect.text = "Sorry!!!"
        }
        button2Correct = false
        showTotalCount()
        imageMatchLogic()
    }

    func imageMatchLogic() -> Bool{
        
        
        var correctRandomNumber = Int(arc4random()) % animalNames.count
        var wrongRandomNumber = Int(arc4random()) % animalNames.count
        var buttonAnswer = Int(arc4random_uniform(2))
        
        
        while wrongRandomNumber == correctRandomNumber {
            wrongRandomNumber = Int(arc4random()) % animalNames.count
        }
        
        println(animalNames[correctRandomNumber])
        
        var correctImageName = animalNames[correctRandomNumber]
        var wrongImageName = animalNames[wrongRandomNumber]
        
        imageImageViewer.image = UIImage(named: "\(correctImageName).jpg")
        
        if buttonAnswer == 0 {
            btnAnswer1.setTitle(correctImageName, forState: UIControlState.Normal)
            btnAnswer2.setTitle(wrongImageName, forState:  UIControlState.Normal)
            button1Correct = true
        }else{
            btnAnswer2.setTitle(correctImageName, forState: UIControlState.Normal)
            btnAnswer1.setTitle(wrongImageName, forState:  UIControlState.Normal)
            button2Correct = true
        }
        
        return true
    }
    
    func showTotalCount(){
        lblTotalCorrect.text = "Total Correct: \(totalCount)"
    }

}

