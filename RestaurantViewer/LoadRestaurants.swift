//
//  LoadRestaurants.swift
//  RestaurantViewer
//
//  Created by Terry Griffin on 4/6/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//

import UIKit
import CoreData


class Restaurant {
    
}

class LoadRestaurantEntity {
    init(){
        let read : String? = File.read("restaurants.json")
        
        println(read)
    }
}

class File {
    
    class func exists (path: String) -> Bool {
        return NSFileManager().fileExistsAtPath(path)
    }
    
    class func read (path: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        if File.exists(path) {
            return String(contentsOfFile: path, encoding: encoding, error: nil)
        }
        
        return nil
    }
    
    class func write (path: String, content: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> Bool {
        return content.writeToFile(path, atomically: true, encoding: encoding, error: nil)
    }
}