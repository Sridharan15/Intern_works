/*calculate LCM for two numbers
Input : two numbers eg. 2 and 3 
Output  Lcm is 6 */

let firstNumber = 2
let secondNumber = 10

//to find the GCD of two numbers
func findGcd(for firstNumber: Int, and secondNumber: Int) -> Int {
    if firstNumber == 0 {
        return secondNumber
    }
    return findGcd(for: secondNumber % firstNumber, and: firstNumber)
}

//calculate LCM for given two numbers by finding GCD of two numbers
func calculateLcmByFindingGcdOfTwoNumbers(for firstNumber: Int, and secondNumber: Int) -> Int {
    if firstNumber != 0 && secondNumber != 0 {  
        return (firstNumber * secondNumber) / findGcd(for: firstNumber, and: secondNumber) 
    }
    else {
        return 0
    }
} 
print("LCM of \(firstNumber) and \(secondNumber) is \(calculateLcmByFindingGcdOfTwoNumbers(for: firstNumber, and: secondNumber))")
