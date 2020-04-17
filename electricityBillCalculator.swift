/*Problem Statement : Need to calculate Electricity bill for every two months based on below tariffs.  
For domestic
For first 100 units Rs 0/unit
For next 100 units Rs 3.50/unit
For next 300 units Rs 4.60/unit
For unit above 500  Rs 6.60/unit
Fixed charges for two months Rs.50/service

For Commercial
For first 100 units Rs 5.00/unit
Consumption above 100 units bi monthly 8.05/unit
Fixed charges for two months Rs.290/service

Get random numbers as daily consumable units. For domestic random number generation should be in between 1 - 10. For commercial 10 - 100*/

let billType = "domestic"
var amount : Float = 0
var perDayUnitForTwoMonths: [Int] = []
if billType == "domestic" {
    let serviceCharge: Float = 50
    for each in 0..<60 {
        let perDayUnit = Int.random(in:1...10)
        perDayUnitForTwoMonths.append(perDayUnit)
    }
    let units = perDayUnitForTwoMonths.reduce(0,+)
    print("Units:",units)
    if units <= 100 {
        amount = Float(units) * 0
    }
    else if units >= 101 && units <= 200 {
        amount = Float(100 * 0) + (Float(units - 100) * 3.50)
    }
    else if units >= 201 && units <= 500 {
        amount = Float(100 * 0) + (Float(200 - 100) * 3.50) + (Float(units - 200) * 4.60)
    }
    else {
        amount = Float(100 * 0) + (Float(200 - 100) * 3.50) + (Float(500 - 200) * 4.60) + (Float(units - 500) * 6.60)
    }
    let finalAmount = amount + serviceCharge
    print("Bill to be paid is Rs.",finalAmount)
}
if billType == "commercial" {
    let serviceCharge: Float = 290
    for each in 0..<60 {
        let perDayUnit = Int.random(in:10...100)
        perDayUnitForTwoMonths.append(perDayUnit)
    }
    let units = perDayUnitForTwoMonths.reduce(0,+)
    print("Units:",units)
    if units <= 100 {
        amount = Float(units) * 5.00
    }
    else {
        amount = (Float(100) * 5.00) + (Float(units - 100) * 8.05 )
    }
    let finalAmount = amount + serviceCharge
    print("Bill to be paid is Rs.",Float(finalAmount))
}
