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

enum type: String {
    case domestic,commercial
}
func domestic() {
    var amount : Float = 0
    var perDayUnitForTwoMonths: [Int] = []
    let serviceCharge: Float = 50
    let rateOfFirstHundredUnits = 0
    let rateOfNextHundredUnits: Float = 3.50
    let rateOfNextThreeHundredUnits: Float = 4.60
    let rateAboveFiveHundredUnits: Float = 6.60
    for each in 0..<60 {
        let perDayUnit = Int.random(in:1...10)
        perDayUnitForTwoMonths.append(perDayUnit)
    }
    let units = perDayUnitForTwoMonths.reduce(0,+)
    print("Units:",units)
    if units <= 100 {
        amount = Float(units * rateOfFirstHundredUnits)
    }
    else if units >= 101 && units <= 200 {
        amount = Float(100 * rateOfFirstHundredUnits) + (Float(units - 100) * rateOfNextHundredUnits)
    }
    else if units >= 201 && units <= 500 {
        amount = Float(100 *  rateOfFirstHundredUnits) + (Float(200 - 100) * rateOfNextHundredUnits) + (Float(units - 200) * rateOfNextThreeHundredUnits)
    }
    else {
        amount = Float(100 *  rateOfFirstHundredUnits) + (Float(200 - 100) * rateOfNextHundredUnits) + (Float(500 - 200) * rateOfNextThreeHundredUnits) + (Float(units - 500) * rateAboveFiveHundredUnits)
    }
    let finalAmount = amount + serviceCharge
    print("Bill to be paid is Rs.",finalAmount)
}
func commercial() {
    var amount : Float = 0
    var perDayUnitForTwoMonths: [Int] = []
    let serviceCharge: Float = 290
    let  rateOfFirstHundredUnits: Float = 5.00
    let rateAboveHundredUnits: Float = 8.05
    for each in 0..<60 {
        let perDayUnit = Int.random(in:10...100)
        perDayUnitForTwoMonths.append(perDayUnit)
    }
    let units = perDayUnitForTwoMonths.reduce(0,+)
    print("Units:",units)
    if units <= 100 {
        amount = Float(units) *  rateOfFirstHundredUnits
    }
    else {
        amount = Float(100 *  rateOfFirstHundredUnits) + (Float(units - 100) * rateAboveHundredUnits )
    }
    let finalAmount = amount + serviceCharge
    print("Bill to be paid is Rs.",Float(finalAmount))
}
let billType = "domestic"
if billType == type.domestic.rawValue {
    domestic()
}
else {
    commercial()
}
