### First Assignment
#### Due: 5 Feb 15 by class time.

### Instructions:

- Copy the xcode project called `Color_Game_for_Kids` from [here](https://github.com/rugbyprof/4443-and-5373-Swift-Programming/tree/master/InClassCode).
- It should run in xcode straight away showing you something like this:

![](http://f.cl.ly/items/0j0R2g1p3b0W3x0b1t0y/Image%202015-02-03%20at%208.35.44%20PM.png)

- There is a little bit of "extra" code in the `viewController.swift` file. But don't let that confuse you. 

- Find the code block:

```swift
//Run alamo library get request to grab the json data
Alamofire.request(.GET, url)
    .responseJSON { (req, res, json, error) in
        if(error != nil) {
            println("Error: \(error)")
            println(req)
            println(res)
        }
        else {
            println("Success: \(url)")
            var json = JSON(json!)
            for (key: String, subJson: JSON) in json {
                println(key)
            }
            
            //or
            
            for (key,val) in json{
                println("\(key):\(val)")
            }
        }
        
        //Question: How do I access a single value directly?
}
```

And answer the question.

### Submit Answer

- Simply commit your updated project code to your github repo. If the project is not in your repo, then I won't grade it. 

