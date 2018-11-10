# Swift Extensions
#### Version 1.0.0

This Repo is a collection of all Swift extensions I have coded and collected thru the years.

### Content
The extensions, so far, are at classes:
- NSObject (Generic main object)
- theClassName() - Get the name of the class this object is instanciated into

- String
- subscript (i: Int) -> Character - Returns a specific character at index as Character object
- subscript (i: Int) -> String - Returns a specific character at index as String object
- subscript (r: Range<Int>) -> String - Returns a specific range of the string, as sub-String object
- splitByLength(...) -> [String] - split a given string into an array, according to a given size

- Array
- sendElementToTheEnd(...) - Send the chosen element to the end of the array (POP + PUSH)
- stablePartition(...) - Creates two arrays, separating elements based on a condition
- localized(...) - Get the correct localized string from a given '*Strings*' file name inside Main Bundle

- Date
- startOfDay - Get the beginning of the day date of a given date
- endOfDay - Get the last date of the day of a given date
- isTheWeekDay (...) - Check if a given date is a specific week day in english form, from the options (Mon, Tue, Wed, Thu, Fri, Sat, Sun)
- today() - Get today's date, simplified and more visually satfisfying
- startOfMonth() - Get the first date of the month of any given date
- endOfMonth() - Get the last date of the month any given date
- next(...) - Get next weekday, in an enum form
- previous(...) - Get previous weekday, in an enum form
- getWeekDaysInEnglish() - Gets the weekday in english form, from one of the options (monday, tuesday, wednesday, thursday, friday, saturday, sunday)

- NSMutableAttributedString
- attrStr(...) - Create an attributed string passing a txt, a font (type, size, etc) and a color
- UIImage (Mac and iOS SDK only)
- roundedImage() - returns a four corners rounded image of any given UIImage, making it as if it was a circled one
- resizeImageWith(...) - Resizes an image on its largest size by a given size, respecting its previous aspect ratio

### Deploy
There are many ways you can attach this to your projects. The most recommended are (by most important first):
1. Copying the XCodeProject container into your project
To add it, just download this project (or clone it) and drag and drop the xcodeproject container into your project. Simple like that!

2. Adding the target generated framework
This project contains a target framework already built-in after each commit/push.
You can either download the framework only, add it to your XCode project and link it on the Project Settings, or download the whole repo and link the framework to your project.

3. Copying the files you need
As a last resource, you can just download and copy the files you need, under this repo's *extensions* folder into your projects desirable location.

### Development

Want to contribute? Great! Just let me know and I'll let you in.
Also, if you want to start your own from this one, just fork it and get it going...

Found a bug or think of improvements? Just create an issue and I'll gladly answer and implement it.

### Todos
- Write XCTests

### License
MIT

### Created by
Lucas Quintiliano Prates

----

**Hope it helps you as it has helped me. Cheers!**

----
