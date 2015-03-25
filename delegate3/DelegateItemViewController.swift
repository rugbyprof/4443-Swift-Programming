//
//  DelegateItemViewController.swift
//  delegate3
//
//  Created by Terry Griffin on 3/9/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit


protocol DelegateItemViewControllerDelegate: class {
    func DelegateItemViewControllerDidCancel(controller: DelegateItemViewController)
    func DelegateItemViewController(controller: DelegateItemViewController, didFinishAddingItem item: ChecklistItem)
}


class DelegateItemViewController: UITableViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: DelegateItemViewControllerDelegate?
    
    
    @IBAction func cancel() {
        delegate?.DelegateItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        let item = textField.text
        
        delegate?.DelegateItemViewController(self, didFinishAddingItem: item)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        return true
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
}