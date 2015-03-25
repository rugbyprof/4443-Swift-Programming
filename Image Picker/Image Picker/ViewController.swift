//
//  ViewController.swift
//  Image Picker
//
//  Created by Terry Griffin on 1/29/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageImageViewer: UIImageView!
    
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    @IBOutlet weak var lblTotalCorrect: UILabel!
    
    var imageNumber = 0;
    
    var buttonAnswer = 0;
    
    var animalNames :[String] = ["bee","cat","cow","dog","elk","frog","gorilla","guinea_pig","hippo","monkey","owl","panda","penquin","pig","shark","tiger"]
    
    var button0Correct = false
    var button1Correct = false
    
    var totalCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageMatchLogic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAnswer1ACTION(sender: AnyObject) {

        if button0Correct == true {
            lblCorrectIncorrect.text = "Correct!"
            totalCorrect++
            lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
        }else if button0Correct == false{
            lblCorrectIncorrect.text = "Wrong!"
        }
        
        button0Correct = false
        imageMatchLogic()
        
    }

    @IBAction func btnAnswer2ACTION(sender: AnyObject) {
    }
    
    func imageMatchLogic() -> Bool {
        imageNumber = Int(arc4random_uniform(9))
        buttonAnswer = Int(arc4random_uniform(2))
        
        println(animalNames.count)
        
        var imageCurrent : String = animalNames[imageNumber]
        
        println(imageCurrent)
        println(buttonAnswer)
        
        imageImageViewer.image = UIImage(named:"\(imageCurrent).jpg")
        
        if(buttonAnswer == 0){
            button0Correct = true
            btnAnswer1.setTitle(imageCurrent, forState: UIControlState.Normal)
            
            var tempRandomNumber = Int(arc4random()) % animalNames.count
            
            while tempRandomNumber == imageNumber {
                tempRandomNumber = Int(arc4random()) % animalNames.count
            }
            
            let imageWrong = animalNames[tempRandomNumber]
            
            btnAnswer2.setTitle(imageWrong, forState: UIControlState.Normal)
        }
        
        if(buttonAnswer == 1){
            button1Correct = true
            btnAnswer2.setTitle(imageCurrent, forState:  UIControlState.Normal)
        }
        
        
        return true
    }
}

