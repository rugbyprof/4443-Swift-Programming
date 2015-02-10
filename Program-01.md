## Program 1 - Single Page Application
#### Due Friday 20 February by Midnight.
- Must be uploaded into your github repository.
- Do not upload it until the day it is due. 
- This is an individual project. Suspected cheating can result in an F on the assignment and / or removal from the course with a failing grade. 

#### Grading

- Colors populated using a color file obtained via a URL.
- A dictionary type (or class of some kind) is used to store, and access the colors.
- Color names are capatalized using camel case (see bottom example).
- A color distance function is used to choose color names that are close to the original random color.

### Overview

You will take the code given to you in `Program_1_Starter` and use this as a starting point. It contains everything to perform a kids color matching game like you see below:

![](http://f.cl.ly/items/1l3D251F2V0P030j2n34/Image%202015-02-03%20at%208.35.44%20PM.png)

What we would like to do is add functionality to this existing program by making it much harder than matching the 10 predefined colors given to us by iOS:

```swift
var colorNames : [String] = ["Red","Green","Blue","Orange","Black","White","Brown","Purple","Gray","Yellow"]
```
- Instead I want to use 129 colors given to us by HTML standards. A small example follows:

```json
{
aliceblue: "F0F8FF",
antiquewhite: "FAEBD7",
aquamarine: "7FFFD4",
azure: "F0FFFF",
beige: "F5F5DC",
bisque: "FFE4C4",
black: "000000",
blanchedalmond: "FFEBCD",
blue: "0000FF"
}
```

- Notice that the new set of colors is in a json format, with names and hex values. I would assume that you will store this data as a dictionary. Below is an example `Swift` dictionary with color names, and `UInt` values in hexidecimal format. 

```swift
    var colorRGB : [Dictionary<String,UInt>] = [
        ["Red":0xFF0000],
        ["Green":0x00FF00],
        ["Blue":0x0000FF],
        ["Orange":0xFF7F00],
        ["Black":0x000000],
        ["White":0xFFFFFF],
        ["Pink":0xFF6EB4],
        ["Purple":0x8968CD],
        ["Gray":0xBEBEBE],
        ["Yellow":0xFFFF00],
        ["Gray2":0xC0C0C0]
    ]
```

You need to also read your color information from a `JSON` file available via a specified `URL`. This way if the `colors.json` file changes at any time, it will be reflected in your game. 

Also to make the game more challenging, we will utilize a "color distance" function and choose colors that are "close" together. I haven't tested this function, but we will see how well it works. Here is an example in `C++`:

```cpp
typedef struct {
   unsigned char r, g, b;
} RGB;

double ColourDistance(RGB e1, RGB e2)
{
  long rmean = ( (long)e1.r + (long)e2.r ) / 2;
  long r = (long)e1.r - (long)e2.r;
  long g = (long)e1.g - (long)e2.g;
  long b = (long)e1.b - (long)e2.b;
  return sqrt((((512+rmean)*r*r)>>8) + 4*g*g + (((767-rmean)*b*b)>>8));
}
```
The final product should look the same, but the color options should be something like below:

![](http://f.cl.ly/items/360N3N2J1Y0x3b3h3P0B/ios_screen_small.png)
