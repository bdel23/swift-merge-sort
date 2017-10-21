/* Merge Sort
     - Split array in half into subarrays recursively until base case of 1 element.  Merge subarrays.
     - Runtime: O(nlogn)
 */

import UIKit

extension Array where Element: Comparable {
    
    func mergeSort(increasingOrder: (Element, Element) -> Bool) -> [Element] {
        return recursiveMergeSort(array: self, increasingOrder: increasingOrder)
    }
    
    private func recursiveMergeSort(array: [Element], increasingOrder: (Element, Element) -> Bool) -> [Element] {
        let length = array.count
        
        // Base Case
        if length < 2 {
            return array
        }
        
        // Split Array in Two
        let middleIndex = length/2
        let leftArray =  recursiveMergeSort(array: Array(array[0..<middleIndex]), increasingOrder: increasingOrder)
        let rightArray = recursiveMergeSort(array: Array(array[middleIndex...length-1]), increasingOrder: increasingOrder)
        
        // Merge subarrays
        return mergeArrays(leftArray: leftArray, rightArray: rightArray, increasingOrder: increasingOrder)
    }
    
    private func mergeArrays(leftArray: [Element], rightArray: [Element], increasingOrder: (Element, Element) -> Bool) -> [Element] {
        var retArray = [Element]()
        var leftIndex = 0
        var rightIndex = 0
        let totalElements = leftArray.count + rightArray.count
        
        for _ in 0 ..< totalElements {
            if leftIndex >= leftArray.count {
                retArray.append(rightArray[rightIndex])
                rightIndex += 1
            } else if rightIndex >= rightArray.count {
                retArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else if increasingOrder(leftArray[leftIndex], rightArray[rightIndex]) {
                retArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else {
                retArray.append(rightArray[rightIndex])
                rightIndex += 1
            }
        }
        return retArray
    }
}

let numbers = [8,3,7,9,10,23,15,17,25,82,1]
let sortedNumbers = numbers.mergeSort(increasingOrder: <)
