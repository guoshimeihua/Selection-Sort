//: Playground - noun: a place where people can play

import UIKit

var array = NSMutableArray.init(array: ["31", "41", "59", "26", "41", "58"])
for j in 0 ..< array.count-1 {
    var min = array[j].integerValue
    var i = j + 1
    var k = j
    
    while i < array.count {
        if array[i].integerValue < min {
            min = array[i].integerValue
            k = i
        }
        i = i + 1
    }
    
    array.replaceObjectAtIndex(k, withObject: array[j])
    array.replaceObjectAtIndex(j, withObject: String.init(stringInterpolationSegment: min))
}

print(array)

