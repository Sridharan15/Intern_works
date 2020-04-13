/*Problem Statement: There’s bank in the name of Ivy Bank. Bank’s Balance 100,00,00,000.
                     Person X has an account in Ivy Bank. His/her account number is XXXXXXXXXX.
                     And Person X taken a loan amount of 25,00,000 for an interest rate of 14% and the loan tenure is 120 months. 
                     Every month interest has to be recalculated from the principal amount. 
                     At the end of 120 month, how much interest will be paid by the Person X. 
                     Also at the end of 120 months what will be the Banks’s balance.
                     If loan amount is higher than bBank balance Don't provide service.
                     Calculate  using both simple and compound interest.*/

import Foundation
//to find interest compounded
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
//to calculate compound Interest
func compoundInterestCalculator(principle: Double,rate: Double,period: Double) -> Double {
    let n: Double = compounds(compounded: "monthly")
    let finalAmountToBePaid = principle * (pow((1 + (rate / (n * 100))),(n * period)))
    return finalAmountToBePaid
}
//to calculate simple Interest
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

