func merge(left:[Int],right:[Int]) -> [Int] {
    var mergedArray = [Int]()
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedArray.append(left.removeFirst())
        } else {
            mergedArray.append(right.removeFirst())
        }
    }
 
    return mergedArray + left + right
} 
func mergeSort(array: [Int]) -> [Int] { 
    guard array.count > 1 else {
        return array
    }
    let leftArray = Array(array[0..<array.count/2]) 
    let rightArray = Array(array[array.count/2..<array.count]) 
    let left = mergeSort(array: leftArray)
    let right = mergeSort(array: rightArray)
    return merge(left: left, right: right)
}          
      
let elementsOfArray = [12, 11, 13, 5, 6, 7] 
print(mergeSort(array: elementsOfArray))  