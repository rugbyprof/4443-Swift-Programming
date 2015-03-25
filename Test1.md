## Test 1 - Swift
### 4443 Swift Programming - Spring 2015

##### Name:_____________________________________

### Instructions:

- Used the provided paper to answer your questions.
- Don't split answers between pages. 
- Number your pages in the top right corner with appropriate page number, then circle it.
- Syntax errors, if found, are **not** intentional and should not be taken into account when answering questions (unless specifically instructed to do so).
- You may use front and back of each sheet, but answers must be turned in in order. 

--
***Question 1***

Explain the difference between `var` and `let`

--

***Question 2***

What is the difference between `explicit` and `implicit` typing, and give examples of both.

--

***Question 3***

What are the values of a, b, and c after the following code snippet completes?

```swift
var a = 0
let b = ++a
let c = a++
```

--
***Question 4***

Whats the difference between a `tuple` and `dictionary` type? Declare an example of each holding the same data.

--
***Question 5***

Given:
```swift
var surveyAnswer: String?
```

What would the following output?
```swift
println(surveyAnswer) 
```

--
***Question 6***

```swift
let b = 10
var a = 5
a = b
```

What is the value of `a`?

--
***Question 7***

Given:
```swift
var tpl = (23,"Padre",.08,"Hair of the Dog",42,3.14159)
```

In a single line of code, assign each of those values in `tpl` into their own variables, such that:
```swift
a = 23
b = "Padre"
c = .08
d = "Hair of the Dog"
e = 42
f = 3.14159
```

--


--
***Question 8***

Given the following code snippet. Rewrite it using if / else statements.

```swift
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
```

--
***Question 9***

Given:
```swift
var dictionary = ["Bobs": "Dog", "Billys": "Cat", "Suzies": "Cow", "Beths": "Snake"]
```

Write out the `key`:`value` pairs using a single control flow construct. Your output should look like:
```
Bobs:Dog
Billys:Cat
Suzies:Cow
Beths:Snake
```
--

***Question 10***

Is the following snippet valid Swift syntax? Yes or No, explain.

```swift
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
```
--
***Question 11***

Given:

```swift
int a = 0
int b = 1
int c = 1
int d = 0

if ( a || b && c || d ){
	 println("hello")
}else{
    println("goodbye")
}


```

What would be printed? Or are there some problems with the snippet?

--
***Question 12***

Write a function called `MinMax` that receives an array of integers and returns the Minimum value AND the Maximum value in the same return statement. 

--

***Question 13***

Why is it a good practice to create immutable collections in cases where the collection does not need to change?

Give an example of an `immutable` collection. 

--

***Question 14***

Declare an empty array called `someInts`. It obviously holds integers.

--
***Question 15***

```swift
var address = ("Number":3410, "Line 1":Taft Blvd", "Line 2":"Computer Science","City":"Wichita Falls","State":"Tx", "Zipcode":78245)
```
Write out the `City` portion of the above `Tuple` using two different methods.

--
***Question 16***

```swift
var dictionary = ["Bobs": "Dog", "Billys": "Cat", "Suzies": "Cow", "Beths": "Snake"]
```

How would you remove the entry "Billys":"Cat" so that the dictionary prints:

```swift
var dictionary = ["Bobs": "Dog", "Suzies": "Cow", "Beths": "Snake"]
```

--

***Question 17***

```swift
enum CompassPoint {
    case North
    case South
    case East
    case West
}

directionToHead = .South
switch directionToHead {
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}

```

Is this a valid `switch` statement? 

1. Yes or No
2. In either case why or why not?

--


***Question 18***

The following code snippet will error. Can you re-write the last line so that Swift won't complain about it?

```swift
let pi = 3.14159
let radius = 4

var area = radius * radius * pi 
```
--

***Question 19***

Given:

var MyArray:[Int] = [3,5,4,7,8,6,1,2,9]

Write out all the values of `MyArray` using the `closed range` operator.

--
***Question 20***

Explain the difference between a constant class and a constant struct? 

For example:

```swift
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let hd = Resolution(width: 1920, height: 1080)

let someResolution = Resolution()

let someVideoMode = VideoMode()

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
```

If I were to print out the values from `tenEighty` and `alsoTenEighty` what would be output? <br>Write your answer in the following form:

```
tenEighty: { width: value, height: value , interlaced: value,  frameRate: value, name: value }
alsoTenEighty: { width: value, height: value , interlaced: value,  frameRate: value, name: value }
```

Explain your values for each constant.

--
 


