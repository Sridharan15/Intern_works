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

struct ElectricityBillCalculator {
    var rangesAndTariffs: [[Float]]
    var serviceCharge: Float 
    
    //calculate total units
    func calculateTotalUnits(rangeStarts from: Int, rangeEnds with: Int) -> Int {
        var unitsForTwoMonths: Int = 0
        for eachDay in 1...60 {
            let perDayUnit = Int.random(in:from...with)
            unitsForTwoMonths += perDayUnit
        }
        return unitsForTwoMonths
    }

    //calculate total amount
    func calculateTotalAmount(units: Float) {
        var amountToBePaid: Float = 0
        var units = units
        let sortedRangesAndTariffs = rangesAndTariffs.sorted{$0[0] < $1[0]}
        for each in 0..<sortedRangesAndTariffs.count {
            if each == 0 {
                if units < sortedRangesAndTariffs[each][0] {
                    amountToBePaid += units * sortedRangesAndTariffs[each][1]
                    break
                } else {
                    amountToBePaid += sortedRangesAndTariffs[each][0] * sortedRangesAndTariffs[each][1]
                    units -= sortedRangesAndTariffs[each][0]
                }
            }
            else if each == sortedRangesAndTariffs.count - 1 {
                amountToBePaid += units * sortedRangesAndTariffs[each][1]
                break
            } 
            else {
                if units < sortedRangesAndTariffs[each][0]  - sortedRangesAndTariffs[each - 1][0]  {
                    amountToBePaid += units * sortedRangesAndTariffs[each][1]
                    break
                } else {
                    amountToBePaid += (sortedRangesAndTariffs[each][0] - sortedRangesAndTariffs[each - 1][0]) * (sortedRangesAndTariffs[each][1])
                    units = units - (sortedRangesAndTariffs[each][0] - sortedRangesAndTariffs[each - 1][0])
                }
            }
        }
        let finalAmountToBePaid = amountToBePaid + serviceCharge
        print("Bill to be paid: Rs.",finalAmountToBePaid)
    }
}

enum BillType {
    case domestic,commercial
}

let type: BillType = .commercial 
switch type {
    case .domestic:
        var domesticBill = ElectricityBillCalculator(rangesAndTariffs: [[100,0],[200,3.50],[500,4.60],[501,6.60]], serviceCharge: 50)
        let totalUnits = Float(domesticBill.calculateTotalUnits(rangeStarts: 1, rangeEnds: 10))
        print("Total units consumed:",totalUnits)
        domesticBill.calculateTotalAmount(units: totalUnits)
    case .commercial:
        var commercialBill = ElectricityBillCalculator(rangesAndTariffs: [[100,5.00],[200,8.05]], serviceCharge: 290)   
        let totalUnits = Float(commercialBill.calculateTotalUnits(rangeStarts: 10, rangeEnds: 100))
        print("Total units consumed:",totalUnits)
        commercialBill.calculateTotalAmount(units: totalUnits)
}
