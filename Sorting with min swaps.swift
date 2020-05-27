/*sort the elements of array with minimum swaps. Also find the sum of difference of values from the given index position in reverse order.
Inputs: Array size, Array elements, Index position
output: Sorted array with minimum swap count, sum of difference of values */

let sizeOfTheArray = 5
var arrayElements = [-5,-90,5,30,2]
let indexPosition = 3
func doSelectionSort(elementsOfArray: inout [Int]) -> Int {
    var totalSwaps = 0
    for currentIndex in 0..<sizeOfTheArray {
        var minimumIndex = currentIndex
        for eachElement in (currentIndex + 1)..<sizeOfTheArray {
            if elementsOfArray[eachElement] < elementsOfArray[minimumIndex] {
                minimumIndex = eachElement
            }
        }
        if minimumIndex != currentIndex {
            elementsOfArray.swapAt(minimumIndex,currentIndex)
            totalSwaps += 1
        }
    }
    return totalSwaps
}

func doCalculation(indexPosition: Int)-> Int {
  var sumOfSubtractedValues = 0
  for each in stride(from: indexPosition, to: 0, by: -1) {
    sumOfSubtractedValues += arrayElements[each] - arrayElements[each - 1]
  }
  return sumOfSubtractedValues
}

var swapCount = doSelectionSort(elementsOfArray: &arrayElements)
print("Sorted Array is",arrayElements)
print("Total Swap Count:",swapCount)

if indexPosition > 0 && indexPosition < sizeOfTheArray {
  print("Sum of subtracted values is \(doCalculation(indexPosition: indexPosition))")
}
