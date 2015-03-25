//
//  ChecklistItem.swift
//  Checklist 5373
//
//  Created by Terry Griffin on 2/26/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import Foundation

struct ChecklistItem {
    var text = ""
    var checked = false
}

class ChecklistItems{
        
        var items:[ChecklistItem]
        
        init(){
            items = [ChecklistItem]()
        }
    
        func addItem(label: String, checked: Bool){
                
            let size = items.count
            var item = ChecklistItem()
            
            item.text = label
            item.checked = checked
                
            items.append(item)
            
        }
        
        func addItem(item: ChecklistItem){
                
            let size = items.count
            items.append(item)
                
        }
    
        func getItem(index:Int)->ChecklistItem{
            return items[index]
        }
        
        func listCount()->Int{
            return items.count
        }
        
        func removeItem(index:Int)->Bool{
            if index < items.count {
                items.removeAtIndex(index)
                return true
            }else{
                return false
            }
        }
        
    
}