//Functions
func greet(user:String) {
    print("Good Morning! \(user)")
}

//Function without Parameters
func greet() {
    print("Good Morning!")
}
greet()

//Function with parameters
func greet(user: String) {
    print("Good Morning! \(user)")
}
greet(user: "Isac")

//Function without return values
func greet(user: String) {
    print("Good Morning! \(user)")
}
greet(user: "Isac")

//Function with return values
func greet(user: String) -> String {
    return "Good Morning! \(user)"
}
let greeting = greet(user: "Isac")
print("""
	You have a new message:	
	\(greeting)
	""" )

//Function with multiple parameters and multiple return types
func greetUser(name:String, age:Int) -> (String, Int) {
    
    let msg = "Good Morning!" + name
    var userage = age
    if age < 0 {
            userage = 0
    }
    return (msg, userage)
}
let msg = greetUser(name: "Jack", age: -2)
print(msg.0)
print("You have \(msg.1) coins left")

//Recursive Functions
func countDownToZero(num: Int) {
    print(num)
    if num > 0 {
        countDownToZero(num: num - 1)
    }
}
print("Countdown:")
countDownToZero(num:3)

//Parameter labels
func greet(to user: String) {
    print("Good Morning! \(user)")
}
greet(to : "Isac")

//Omitting Parameter Labels
func greet(_  user: String) {
    print("Good Morning! \(user)")
}
greet(to : "Isac")

//Default Parameters
func greet(_ user: String, value: Int = 3) {
	print("Hello \(user) you got \(value)")
} 
greet("Isac")
greet("Peter", value: 2)

//Variadic Parameters
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1,2,3)

//Inout Parameters
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
     let temporary = a
     a = b
     b = temporary
}

var someInt = 3
var anotherInt = 10
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//Nested Functions
func greet(user: String) {
    
    func addMessageAndGreet() {
        print("Hello! \(user)")
    }
    addMessageAndGreet()
}
greet(user: "Isac")
 
