//
//  ViewController.swift
//  delegate2
//
//  Created by Terry Griffin on 3/9/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AddItemViewControllerDelegate {

    @IBOutlet weak var giveMeDelegate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addItemViewControllerDidCancel(controller: AddItemViewController) {
        dismissViewControllerAnimated(true, completion: nil)
        println("cancel")
    }
    
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: String) {
        
        giveMeDelegate.text = item
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItem" {
            let navigationController = segue.destinationViewController as UINavigationController
            let controller = navigationController.topViewController as AddItemViewController
            controller.delegate = self
        }
    }

}

