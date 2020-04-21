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

enum BillType {
    case domestic, commercial
}
enum DomesticTariffRates: Float {
    case firstHundred = 0
    case nextHundred = 3.50
    case nextThreeHundred = 4.60 
    case aboveFiveHundred = 6.60
}
enum CommercialTariffRates: Float {
    case firstHundred = 5.00
    case aboveHundred = 8.05
}
// calculate total units consumed
func calculateTotalUnits(rangeStarts from: Int, rangeEnds with: Int) -> Int {
    var unitsForTwoMonths: Int = 0
    for eachDay in 1...60 {
        let perDayUnit = Int.random(in:from...with)
        unitsForTwoMonths += perDayUnit
    }
    return unitsForTwoMonths
}
// calculate total amount without charges
func calculateAmount(units: Int, rate: Float, calculatedRange: Int) -> Float {
    let amount = Float(units - calculatedRange) * rate
    return amount
}
// calculate bill for domestic purpose
func calculateBillForDomesticPurposes() {
    let serviceCharge: Float = 50
    var amountWithoutServiceCharge: Float = 0
    var tariff: DomesticTariffRates
    let totalUnits = calculateTotalUnits(rangeStarts: 1, rangeEnds: 10)
    print("Total Units consumed:",totalUnits)
    if totalUnits < 100 {
        tariff = .firstHundred
        amountWithoutServiceCharge += calculateAmount(units: totalUnits, rate: tariff.rawValue, calculatedRange: 0) 
    }
    else if totalUnits > 100 && totalUnits < 201 {
        tariff = .nextHundred
        amountWithoutServiceCharge += calculateAmount(units: totalUnits, rate: tariff.rawValue, calculatedRange: 100)
    }
    else if totalUnits > 200 && totalUnits < 501 {
        tariff = .nextThreeHundred
        amountWithoutServiceCharge += calculateAmount(units: totalUnits, rate: tariff.rawValue, calculatedRange: 200)
    }
    else {
        tariff = .aboveFiveHundred
        amountWithoutServiceCharge += calculateAmount(units: totalUnits, rate: tariff.rawValue, calculatedRange: 500)
    }
    let finalAmountToBePaid = amountWithoutServiceCharge + serviceCharge
    print("Bill to be Paid: Rs.",finalAmountToBePaid) 
}
// calculate bill for commercial purpose
func calculateBillForCommercialPurposes() {
    let serviceCharge: Float = 290
    var amountWithoutServiceCharge: Float = 0
    var tariff: CommercialTariffRates
    let totalUnits = calculateTotalUnits(rangeStarts: 10, rangeEnds: 100)
    print("Total Units consumed:",totalUnits)
    if totalUnits < 100 {
        tariff = .firstHundred
        amountWithoutServiceCharge += calculateAmount(units: totalUnits, rate: tariff.rawValue, calculatedRange: 0) 
    }
    else {
        tariff = .aboveHundred
        amountWithoutServiceCharge += calculateAmount(units: totalUnits, rate: tariff.rawValue, calculatedRange: 100)
        let finalAmountToBePaid = amountWithoutServiceCharge + serviceCharge
        print("Bill to be Paid: Rs.",finalAmountToBePaid)
    }
}
let type: BillType = .commercial
switch type {
    case .domestic :
        calculateBillForDomesticPurposes()
    case .commercial :
        calculateBillForCommercialPurposes()    
}
