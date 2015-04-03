## Test 2 - Swift Language 
### Wed 15 Apr @ 4:00 p.m.

- Ios Apprentice Chapter 3 
    - Pages 5 - 28
        - Basic Language Components 
    - Pages 78 - 91 (Objects Etc)
        - Overriding methods
        - Inheritance
        - Casts
        - The AnyObject type
        
- Passing data 
    - Prepare for Segue
    - Protocol and Delegate

Example Questions:

```swift
/**
Print out the grade school multiplication table upto 12*12.
    
INPUT SAMPLE:

There is no input for this program.
    
    OUTPUT SAMPLE:

    Print out the table in a matrix like fashion, each number formatted to a 
    width of 4 (The numbers are right-aligned and strip out leading/trailing 
    spaces on each line). The first 3 line will look like:


    1   2   3   4   5   6   7   8   9  10  11  12
    2   4   6   8  10  12  14  16  18  20  22  24
    3   6   9  12  15  18  21  24  27  30  33  36
*/


for i in 1...12 {
    for j in 1...12 {
        let n = String(format: "%4d",(i*j))
        print(n)
    }
    println("\n")
}
```
