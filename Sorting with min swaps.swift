/*sort the elements of array with minimum swaps. Also find the sum of difference of values from the given index position in reverse order.
Inputs: Array size, Array elements, Index position
output: Sorted array with minimum swap count, sum of difference of values */

let sizeOfTheArray = 5
var arrayElements = [-5,-90,5,30,2]

//find min swaps required to sort an array
func findMinimumSwapsRequiredToSortArray(elementsOfArray: inout [Int]) -> Int {
    var totalSwaps = 0
    for currentIndex in 0..<sizeOfTheArray {
        var minimumIndex = currentIndex
        for secondaryIndex in (currentIndex + 1)..<sizeOfTheArray {
            if elementsOfArray[secondaryIndex] < elementsOfArray[minimumIndex] {
                minimumIndex = secondaryIndex
            }
        }
        if minimumIndex != currentIndex {
            elementsOfArray.swapAt(minimumIndex,currentIndex)
            totalSwaps += 1
        }
    }
    return totalSwaps
}

//calculate sum of subtracted values till given index position
func calculateSumOfSubtractedValuesOfArrayTillIndexPosition(_ indexPosition: Int)-> Int {
  var sumOfSubtractedValues = 0
  for each in stride(from: indexPosition, to: 0, by: -1) {
    sumOfSubtractedValues += arrayElements[each] - arrayElements[each - 1]
  }
  return sumOfSubtractedValues
}

let swapCount = findMinimumSwapsRequiredToSortArray(elementsOfArray: &arrayElements)
print("Sorted Array is",arrayElements)
print("Min Swap Count:",swapCount)

let indexPosition = 3
if indexPosition > 0 && indexPosition < sizeOfTheArray {
  print("Sum of subtracted values is \(calculateSumOfSubtractedValuesOfArrayTillIndexPosition(indexPosition))")
}
else {
  print("Enter valid index position")
}
