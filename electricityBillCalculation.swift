/*,
Need to calculate Electricity bill for every two months based on below tariffs.  
For domestic
For first 100 units Rs 0/unit
For next 100 units Rs 3.50/unit
For next 300 units Rs 4.60/unit
For unit above 500  Rs 6.60/unit
An additional surcharge of 20% is added to the bill
Get random numbers as daily consumable units. For domestic random number generation should be in between 1 - 10*/
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
