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
        var domesticRangeAndTariff = ElectricityBillCalculator(rangesAndTariffs: [[100,0],[200,3.50],[500,4.60],[501,6.60]], serviceCharge: 50)
        let totalUnits = Float(domesticRangeAndTariff.calculateTotalUnits(rangeStarts: 1, rangeEnds: 10))
        print("Total units consumed:",totalUnits)
        domesticRangeAndTariff.calculateTotalAmount(units: totalUnits)
    case .commercial:
        var commercialRangeAndTariff = ElectricityBillCalculator(rangesAndTariffs: [[100,5.00],[200,8.05]], serviceCharge: 290)   
        let totalUnits = Float(commercialRangeAndTariff.calculateTotalUnits(rangeStarts: 10, rangeEnds: 100))
        print("Total units consumed:",totalUnits)
        commercialRangeAndTariff.calculateTotalAmount(units: totalUnits)
}