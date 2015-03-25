//
//  ViewController.swift
//  Swift Score Keeping app
//
//  Created by John Bura on 9/22/14.
//  Copyright (c) 2014 Mammoth Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lblScore1: UILabel!
    @IBOutlet weak var lblScore2: UILabel!
    
    
    @IBOutlet weak var txtTeam1: UITextField!
    @IBOutlet weak var txtTeam2: UITextField!
    
    var team1Score = false
    var team2Score = false
    
    var team1OldValue : Double = 0
    var team2OldValue : Double = 0
    
    var team1ScorePrint = 0
    var team2ScorePrint = 0
    
    var maxScoreTeam1STRING = ""
    var maxScoreTeam2STRING = ""
    
    var maxScoreTeam1 : Float = 0
    var maxScoreTeam2 : Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnTeam1Down(sender: UIButton) {
        team1Score = true
        subtractScore()
    }

    @IBAction func btnTeam1Up(sender: UIButton) {
        team1Score = true
        addScore()
    }
    
    @IBAction func btnTeam2Down(sender: UIButton) {
        team2Score = true

        subtractScore()
    }
    
    @IBAction func btnTeam2Up(sender: UIButton) {
        team2Score = true
   
        addScore()
    }
    
    func addScore() -> Bool{
        maxScore()

        if maxScoreTeam1 == 0{
            maxScoreTeam1 = 200
        }
        
        if maxScoreTeam2 == 0{
            maxScoreTeam2 = 200
        }
        
       
    
        if team1Score == true{
            if team1ScorePrint < Int(maxScoreTeam1){
                team1ScorePrint = team1ScorePrint + 1
                lblScore1.text = "\(team1ScorePrint)"
            }
        }
        
        if team2Score == true{
           
            if team2ScorePrint < Int(maxScoreTeam2){
                team2ScorePrint = team2ScorePrint + 1
                lblScore2.text = "\(team2ScorePrint)"
            }
        }
        
        team1Score = false
        team2Score = false
        
        return true
    }
    
    func subtractScore() -> Bool{
        
        if team1Score == true{
            if team1ScorePrint > 0 {
                team1ScorePrint = team1ScorePrint - 1
                 lblScore1.text = "\(team1ScorePrint)"
            }
        }
        
        if team2Score == true{
            if team2ScorePrint > 0 {
                team2ScorePrint = team2ScorePrint - 1
                lblScore2.text = "\(team2ScorePrint)"
            }
        }
        
        team1Score = false
        team2Score = false
        
        return true
    }
    
    func maxScore() -> Bool {
        maxScoreTeam1STRING = txtTeam1.text
        maxScoreTeam2STRING = txtTeam2.text
        
        maxScoreTeam1 = (maxScoreTeam1STRING as NSString).floatValue
        maxScoreTeam2 = (maxScoreTeam2STRING as NSString).floatValue
      

        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtTeam1.resignFirstResponder()
        txtTeam2.resignFirstResponder()
    }
    
}

