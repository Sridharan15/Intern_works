let sizeOfTheArray = 5
var arrayElements = [99,25,60,32,44]
public var swapCount = 0
var totalValue = 0
var index = 3
func doSelectionSort(elementsOfArray: inout [Int]) -> ([Int], Int) {
    for currentIndex in 0..<sizeOfTheArray {
        var minimumIndex = currentIndex
        for eachElement in (currentIndex + 1)..<sizeOfTheArray {
            if elementsOfArray[eachElement] < elementsOfArray[minimumIndex] {
                minimumIndex = eachElement
            }
        }
        if minimumIndex != currentIndex {
            elementsOfArray.swapAt(minimumIndex,currentIndex)
            swapCount += 1
        }
    }
    return (elementsOfArray,swapCount)
}
doSelectionSort(elementsOfArray: &arrayElements)
print(arrayElements)
print("Total Swap Count:",swapCount)
for each in stride(from: index, to: 0, by: -1) {
    totalValue += arrayElements[each] - arrayElements[each - 1]
}
print(totalValue)