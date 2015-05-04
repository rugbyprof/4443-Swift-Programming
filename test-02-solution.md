
## Name __________________________

- Write your answers on the paper provided
- Turn in all materials
- Make sure you answer clearly and concisely
- Since this is a language class, syntax is important not just logic
- Answers will be graded on correctness and best practice

| Question   |  Points  |  Earned  |
|:--------------------:|:----------------:|:----------------:|
| 01         |    10    |        |
| 02         |    10    |        |
| 03         |    5     |        |
| 04        |    5     |        |
| 05        |   10     |        |
| 06        |    5     |        |
| 07        |  15      |        |
| 08        |  5       |        |
| 09        |   5      |        |
| 10        |  10      |        |
| 11        |   5    |        |
| 12        |   15    |        |
| 13        |   10    |        |
| 14        |   5    |        |
| 15        |   10    |        |
| 16        |   10    |        |
| 17        |   5    |        |

#### Question 1 `10 points`

Write a function called `doTheCalculation` wich receives `3` parameters:
- Array of doubles called `Data` 
- Integer called `Iterations` 
- Double called `Ratio` 

Loop through the array the number of times dictated by `Iterations` and multiply each entry by `Ratio`.

When this is complete, return the average of all the values in the array.

***Solution:***
```swift
func doTheCalculation(var Data: [Double], Iterations: Int, Ratio: Double) -> Double {
    var Sum = 0.0
    for i in 0..<Iterations{
        for j in 0..<Data.count{
            Data[j] *= Ratio
            if (i == (Iterations - 1)){
                Sum += Data[j]
            }
        }
    }
    
    return Sum / Double(Data.count)
}

var answer = doTheCalculation([16,16,16,16,16,16], 3, 0.5)
```
----

#### Question 2 `10 points`

Given: 

```swift
enum IceCream {
    case Vanilla
    case Chocolate
    case Strawberry
    case Banana
    case Mint
}

var favorite = IceCream.Vanilla

```

Write a switch statement that handles all possible values and prints out a snappy statement like: `"Vanilla! Gross!"`.

***Solution:***
```swift
enum IceCream {
    case Vanilla
    case Chocolate
    case Strawberry
}

var favorite = IceCream.Vanilla

switch favorite {
case .Vanilla : println("vanilla is awesome!")
case .Chocolate: println("chocolate is awesome!")
case .Strawberry: println("vanilla is awesome!")
case .Banana: println("banana is awesome!")
case .Mint: println("mint is awesome!")
}
```

----

#### Question 3  `5 points`

Declare a variable called `x` to be a `Double` without using the keyword `Double`

***Solution:***
```swift
var x = 0.0
```

----

#### Question 4  `5 points`

Whats the difference between the following two statements:

```swift
var item: ChecklistItem
var item = ChecklistItem()
```
Your answer should be no longer than a sentence or two.

***Solution:***
```swift
var item: CheckListItem    // Declares a variable of type item and doesnt initialize it 
var item = CheckListItem() // Declares a variable of type item AND runs the constructor creating an 
                           // instance or initializing it with memory locations for each member variable.
```

----

#### Question 5 `10 points` 

Given:
- An array if integers: `var A = [4,58,9,12,23,4,2,56,34,77,21,11]`
- You can assume that `A` will never be empty.

Write a function called `getMinMax` that receives an _Int_ array, and returns both the _minimum_ and _maximum_ value found in the array.

***Solution:***
```swift
var A = [23,45,34,67,23,34,12,78,34,12,88,7,56]

func getMinMax(A:[Int]) -> (Min:Int,Max:Int){
    var min = A[0];
    var max = A[0];
    
    for i in A[0..<A.count]{
        if i < min{
            min = i
        }
        if i > max{
            max = i
        }
    }
    
    return (min,max)
}

let minmax = getMinMax(B)

println(minmax)
```

----

#### Question 6 `5 points` 

Given some optional: `var list : Checklist?` write the necessary code to unwrap it. Do not use forced unwrapping.

***Solution:***
```swift
if let list = list {
    //Do something with list, it exists.
}else{
    //List is nil, handle that
}
```

----

#### Question 7 `15 points` 

Given the following code snippet:

```swift
let nums = [3, 4, 5, 6, 7, 8, 9]

func whoknows(s1: Int, s2: Int) -> Bool {
    if (s1 % 2) == 0 {
        return s1 < s2
    }
    return s1 > s2
}

var something = sorted(nums, whoknows)
```
What order will `nums` be when it is run?

Write your answer clearly in the following format: `[ ? , ? , ? , ... , ? ]

***Solution:***
```
[9, 7, 5, 3, 4, 6, 8]
```

----

#### Question 8 `5 points` 

Given the following `For-In` loop:

```
for item in items {
    if !item.checked {
        print("\(item.name) , \(item.age) , \(item.fatPercentage)")
        count += 1
    }
}
```

Write the ***class*** or ***struct*** definition for items.

***Solution:***
```swift
//Method 1
struct item{
    var name : String
    var age : Int
    var fatPercetage : Double
    var checked: Bool
}

//Method 2

class item {
    var name : String = ""
    var age : Int = 0
    var fatPercentage : Double = 0.0
    var checked : Bool = false
}

//Method 2.5

class item {
    var name : String?
    var age : Int?
    var fatPercentage : Double?
    var checked : B
}

//Method 3

class item {
    var name = ""
    var age = 0
    var fatPercentage = 0.0
    var checked = false
}

//Method 4

//Create a class similar to method 1, but you need an init() method to initialize each value

```

----

#### Question 9 `5 points` 

Given the following code snippet:

```swift
let pi = 3.141592
pi = 3 //not allowed

//allowed
let item = ChecklistItem()
item.text = "Do the laundry"
item.checked = false
item.dueDate = yesterday
```
Explain why one constant can't be changed, while another one can.

Your answer should only be one or two sentences. 

***Solution:***
```swift
let pi = 3.14159 

/*
This is a "value" type. Value types cannot be changes because the reference that points 
to it, points to the actual value (which can't be changed).
*/

let item = CheckListItem() 
/*
This is a "reference" type. The items within the reference can be changed becuase it's 
not changing the actual reference itself, just the items accessed by that reference.
*/
```

----

#### Question 10 `10 points` 

Given the following snippet:

``` swift

var names = ["Bob","Sue","Diya","Raj","Kamya"]

//Function
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

//Call
var reorder = sorted(names, backwards)
```

How could you reorder the array without using the separate function "backwards".

Show your answer as you would write it in Swift. 

***Solution:***
```swift
var reversed = sorted(names,{(s1:String,s2:String) -> Bool in
    return s1 > s2
})
```

----

#### Question 11 `15 points`

***Part A:***

Given the following:

```swift
var array1 = ["a","b","c"]
var array2 = array1
array2[2] = "x"
```

What are the values of `array1` and `array2`?

***Part B:***
```swift
//case1
struct S { var data: Int = -1 }
var a = S() 
var b = a						
a.data = 42						
println(a.data = "\(a.data), b.data = \(b.data)")
	
//case 2
class C { var data: Int = -1 } 
var x = C() 
var y = x						
x.data = 42					
println("x.data = \(x.data), y.data = \(y.data)")	
```

Output:

```
a.data = ?, b.data = ?
x.data = ?, y.data = ?
```

What will be the output in both cases and explain why?

***Solution:***
```
/*
Swift’s Array types are implemented as structures. This means that arrays are copied when they are assigned
to a new constant or variable, or when they are passed to a function or method.
*/
["a", "b", "c"]
["a", "b", "x"]

/*
Swift structs are implemented as a "value" type, and are copied when assigned to a new variable or 
constant. Classes on the other hand are reference types, and when copied to another variable or 
constant both instances point to the same memory location.
*/
a.data = 42 b.data = -1
m.data = 42 n.data = 42
```

----

#### Question 12 `5 points` 

Given the following snippet:

``` swift
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
```

Write a `for in` loop to traverse through the dictionary and display each value along with its corresponding type.

Your output should look like:

```
Prime: [2, 3, 5, 7, 11, 13]
Fibonacci: [1, 1, 2, 3, 5, 8]
Square: [1, 4, 9, 16, 25]
```

***Solution:***
```swift
//Solution one
for (key,list) in interestingNumbers {
    println("\(key) : \(list)")
}

//Solution two (not very swift like)
for (k,v) in interestingNumbers {
    print("\(k):[")
    var i = 0
    for val in v {
        print("\(val)")
        if i < v.count-1 {
            print(",")
        }
        i++
    }
    println("]")
}

```

----

#### Question 13 `10 points`

Given the following categories of animals: 
```swift
House Hold Animals 	    ["dog", "cat"]
Farm Animals 			["cow", "chicken", "sheep", "dog", "cat"]
City Animals            ["bird", "mouse" , "cat"]
Jungle Animals          ["snake","monkey","bird","gorilla"]
```
A. What collection type would you use to store these in Swift?

B. If I wanted to quickly find out which animals were in more than one group or find the animal that's only in one group, how would I do so? 

***Solution:***
```
I was looking for "Sets" as an answer, but then realized that Set operations would be more difficult
to use based on part B of the question. So, any container type with some justification would suffice.
```

----

#### Question 14 `5 points`

Look at the output from the following statement:

```swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
```

Output:
> 3 times 2.5 is 7.5

A. Does string interpolation in swift allow for arithmetic operations inside a string?

B. If not, what should the answer be, or would it error?

***Solution:***
```
A. Yes

B. No error

String interpolation is perfectly fine with doing arithmetic operations inside the parenthsesis. 

```
----

#### Question 15 `10 points`

Take the following code snippet, and re-write it in a concise compact format.

```swift
let contentHeight = 40
let hasHeader = true
var rowHeight = contentHeight
if hasHeader {
    rowHeight = rowHeight + 50
} else {
    rowHeight = rowHeight + 20
}
```

***Solution:***
```swift
var contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// Parenthesis are necessary around the ternary statement because otherwise the binary operator "+" gets 
// a little annoyed trying to be added to a "Bool". 
```

----

#### Question 16 `10 points`

```swift
var cities = ["Atlanta", "Dallas"]
```
A. Write the code to add the city "Chicago" to the array, cities.

B. Write the code to add the city "New York" to the array after the city "Atlanta".

C. Write the code to remove the city "Dallas" from the array, cities.

***Solution:***
```swift
cities.append("Chicago")
cities.insert("New York", atIndex: 1)
cities = cities.filter() { $0 != "Dallas" }
//NOT ACCEPTABLE:
cities.removeAtIndex(2) //Not a good solution because your making an assumption where "Dallas" is.
cities.removeLast() //Also not good for same reason
```

----

#### Question 17 `5 points`

Provide an operator for comparing reference-type constants and variables to determine whether they refer to same object?

***Solution:***
```swift
=== //That's it.
```
