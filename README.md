# ArrayBuild

Custom `ArrayBuilder` with `resultBuilder`

## Usage

```swift
import ArrayBuilder

let someNumber = 19
@ArrayBuilder<Int> var builder: [Int] {
    if someNumber < 12 {
        31
    } else if someNumber == 19 {
        32
    } else {
        33
    }
}

// print
print(builder)
// [32]
```


## Installation

You can add KeyboardHost to an Xcode project by adding it as a package dependency.

From the **File** menu, select **Swift Packages** › **Add Package Dependency…**
Enter https://github.com/HumorousGhost/ArrayBuild into the package repository URL text field
Link **KeyboardHost** to your application target
