//
//  SecondViewController.swift
//  DelegateExample
//
//  Created by Terry Griffin on 3/11/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//

import UIKit

protocol helpSendDataDelegate{
    func didSendData(controller:SecondViewController,text:String)
}

class SecondViewController: UIViewController {

    var delegate:helpSendDataDelegate? = nil
    
    @IBOutlet weak var sendText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendDataAction(sender: AnyObject) {
        
        if delegate != nil {
            let someText = sendText.text
            delegate!.didSendData(self, text: someText)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
