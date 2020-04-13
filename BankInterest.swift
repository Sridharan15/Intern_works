import Foundation
func compounds(compounded: String) -> (Double) {
    var n: Int = 0
    if compounded == "yearly" {
        n = 1
    }
    else if compounded == "semiannually" {
        n = 2
    }
    else if compounded == "monthly" {
        n = 12
    }
    else if compounded == "quarterly" {
        n = 4
    }
    else if compounded == "weekly" {
        n = 52
    }
    else if compounded == "daily" {
        n = 365
    }
    return Double(n)
}
func compoundInterestCalculator(principle: Double,rate: Double,period: Double) -> Double {
    let n: Double = compounds(compounded: "monthly")
    let finalAmountToBePaid = principle * (pow((1 + (rate / (n * 100))),(n * period)))
    return finalAmountToBePaid
}
func simpleInterestCalculator(principle: Double,rate: Double,period: Double) -> Double {
    let interest: Double = (principle * rate * period) / 100
    return interest
}
var bankBalance: Double = 1_000_000_000
var result: Double = 0
let loanAmount: Double = 2500000
let years: Double = 0
let months: Double = 120
let timePeriod: Double = years + (months / 12)
let rateOfInterest: Double = 14 
let interestType = "compound"
if bankBalance >= loanAmount {
    if interestType == "compound" {
        result = compoundInterestCalculator(principle: loanAmount,rate: rateOfInterest,period: timePeriod)
        print("Total interest to be paid:",(result - loanAmount),"\n","Total amount to be paid:",result,"\n",
              "Bank Balance:",(bankBalance + result - loanAmount))
    }
    else {
        result = simpleInterestCalculator(principle: loanAmount,rate: rateOfInterest,period: timePeriod)
        print("Total interest to be paid:",(result),"\n","Total amount to be paid:",(result + loanAmount),"\n",
              "Bank Balance:",(bankBalance + result + loanAmount))
    }
}
else {
    print("sorry we can't provide loan")
}    

