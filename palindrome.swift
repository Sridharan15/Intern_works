//convert the given input to string and check for palindrome
let inputValue = 122321
let inputString = String(inputValue)
let reversedString = String(inputString.reversed())
if inputString == reversedString {
    print("True")
}
else {
    print("False")
}

//another method
let inputValue = 124321
var copyOfInput : Int = inputValue
var remainder: Int , reversed = 0
while(copyOfInput != 0) {
    remainder = (copyOfInput % 10)
    reversed = (reversed * 10) + remainder
    copyOfInput  = copyOfInput / 10

}
if inputValue == reversed {
    print("True")
}
else {
    print("False")
}
