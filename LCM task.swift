var firstNumber = 10
var secondNumber = 20
func numberIsValid(for number: Int) -> Bool {
    if number != 0 {
        return true
    }
    return false
}
func findGcd(for firstNumber: Int, and secondNumber: Int) -> Int {
    if firstNumber == 0 {
        return firstNumber
    }
    return findGcd(for: secondNumber % firstNumber,and: firstNumber)
}
func calculateLcm(for firstNumber: Int, and secondNumber: Int) -> Int {
    if numberIsValid(for: firstNumber) && numberIsValid(for: secondNumber) {
            return (firstNumber * secondNumber) / findGcd(for: firstNumber, and: secondNumber) 
    }
    else {
        return 0
    }
} 
print("LCM of \(firstNumber) and \(secondNumber) is \(calculateLcm(for: firstNumber, and: secondNumber))")
