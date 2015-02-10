## Program 1 - Single Page Application
#### Due Friday 20 February by Midnight.

### Overview

You will take the code given to you in `Program_1_Starter` and use this as a starting point. It contains everything to perform a kids color matching game like you see below:

![](http://f.cl.ly/items/1l3D251F2V0P030j2n34/Image%202015-02-03%20at%208.35.44%20PM.png)

What we would like to do is add functionality to this existing program by making it much harder than matching the 10 predefined colors given to us by iOS:

```swift
var colorNames : [String] = ["Red","Green","Blue","Orange","Black","White","Brown","Purple","Gray","Yellow"]
```
Instead I want to use 129 colors given to us by HTML standards. A small example follows:

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

