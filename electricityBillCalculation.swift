let billType = "domestic"
var amount : Double = 0
if billType == "domestic" {
    let perDayUnit = Int.random(in:1...10)
    let units = perDayUnit * 60
    print(units)
    if units <= 100 {
        amount = Double(units * 0)
    }
    else if units >= 101 && units <= 200 {
        amount = Double(100 * 0) + (Double(units - 100) * 3.50)
    }
    else if units >= 201 && units <= 500 {
        amount = Double(100 * 0) + (Double(200 - 100) * 3.50) + (Double(units - 200) * 4.60)
    }
    else {
        amount = Double(units) * 6.60
        amount = amount + Double(amount * 0.2)
    }
    print("Bill to be payed is Rs.",amount)
}
