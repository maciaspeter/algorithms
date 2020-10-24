import UIKit
import Foundation

//let array = [10, 6, 2, 1, 3, 8, 7, 9, 20, 42, 100, 24]

func randomSequenceGenerator(min: Int, max: Int) -> () -> Int {
    var numbers: [Int] = []
    return {
        if numbers.isEmpty {
            numbers = Array(min ... max)
        }

        let index = Int(arc4random_uniform(UInt32(numbers.count)))
        return numbers.remove(at: index)
    }
}

var array : [Int] = []

let getRandom = randomSequenceGenerator(min: 0, max: 10000)
for _ in 0...10000 {
    array.append(getRandom())
}

print(array)

func mergeSort<Element : Comparable>(_ array: [Element]) -> [Element] {
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count / 2
    
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))

    return merge(left, right)
}

func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        }
        else if rightElement < leftElement {
            result.append(rightElement)
            rightIndex += 1
        }
        else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}

var start = DispatchTime.now() // <<<<<<<<<< Start time
let finalMergeSort = mergeSort(array)
var end = DispatchTime.now()   // <<<<<<<<<<   end time
var nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
var timeInterval = Double(nanoTime) / 1_000_000_000
print("mergeSort : \(timeInterval)")



func growthSort<Element : Comparable>(_ array: [Element]) -> [Element] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count / 2

    var leftIndex = middleIndex
    var rightIndex = middleIndex

    //if element - 1 is bigger, keep going to left
    while 0 < leftIndex {
        
        let element = array[leftIndex]
        let elementLeftOfTheElement = array[leftIndex - 1]

        if(elementLeftOfTheElement < element) {
            leftIndex -= 1
        }
        else {
            break
        }
    }
    
    while rightIndex < array.count - 1 {
        
        let element = array[rightIndex]
        let elementRightOfTheElement = array[rightIndex + 1]

        if(element < elementRightOfTheElement) {
            rightIndex += 1
        }
        else {
            break
        }
    }

    let left = growthSort(Array(array[..<leftIndex]))
    let middle = growthSort(Array(array[leftIndex..<rightIndex]))
    let right = growthSort(Array(array[rightIndex...]))

    let firstMerge = merge(left, right)
    
    return merge(firstMerge, middle)
}

start = DispatchTime.now() // <<<<<<<<<< Start time
let finalGrowthArray = growthSort(array)
end = DispatchTime.now()   // <<<<<<<<<<   end time
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("growthSort : \(timeInterval)")

if finalGrowthArray.elementsEqual(finalMergeSort) {
    print("both are same and ordered.")
}
