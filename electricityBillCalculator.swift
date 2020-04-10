let billType = "domestic"
var amount : Float = 0
var perDayUnitsForTwoMonths: [Int] = []
if billType == "domestic" {
    let serviceCharge: Float = 50
    for each in 0..<60 {
        let perDayUnit = Int.random(in:1...10)
        perDayUnitsForTwoMonths.append(perDayUnit)
    }
    let units = perDayUnitsForTwoMonths.reduce(0,+)
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
        amount = Float(units) * 6.60
    }
    let finalAmount = amount + serviceCharge
    print("Bill to be paid is Rs.",finalAmount)
}
if billType == "commercial" {
    let serviceCharge: Float = 290
    for each in 0..<60 {
        let perDayUnit = Int.random(in:10...100)
        perDayUnitsForTwoMonths.append(perDayUnit)
    }
    let units = perDayUnitsForTwoMonths.reduce(0,+)
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