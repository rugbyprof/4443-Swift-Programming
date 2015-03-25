//
//  ViewController.swift
//  delegate3
//
//  Created by Terry Griffin on 3/9/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , DelegateItemViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func DelegateItemViewControllerDidCancel(controller: DelegateItemViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func DelegateItemViewController(controller: DelegateItemViewController, didFinishAddingItem item: String) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

