func infixToPostfix(infixExpression: String) -> String {
    var precedence: [Character: Int] = ["*": 3, "/": 3, "+": 2, "-": 2, "(": 1]
    let numbers = "1234567890"
    var operatorList: [Character] = []
    var postfixList: [Character] = []
    var expressionList: [Character] = Array(createExpressionList(infixExpression: infixExpression))
    expressionList.removeAll{$0 == "0"}
    for each in expressionList {
        if numbers.contains(each) {
            postfixList.append(each)
        }
        else if each == "(" {
            operatorList.append(each)
        }
        else if each == ")" {
            var removedElement = operatorList.removeLast()
            while "\(removedElement)" != "(" {
                postfixList.append(removedElement)
                removedElement = operatorList.removeLast()
            }
        }
        else {
            while operatorList.count != 0 && precedence[operatorList.last!]! >= precedence[each]! {
                postfixList.append(operatorList.removeLast())
            }
            operatorList.append(each)
        }
    }
    while operatorList.count != 0 {
        postfixList.append(operatorList.removeLast())
    }
    return String(postfixList)
}
func createExpressionList(infixExpression: String) -> [Character] {
    let infixExpression = Array(infixExpression)
    let symbolsArray = ["+","-","*","/","(",")"]
    var temporaryValue = 0
    var expressionList: [Character] = []
    for var index in 0..<infixExpression.count {
        if symbolsArray.contains(String(infixExpression[index])) != true {
            temporaryValue *= 10
            temporaryValue += (Int(String(infixExpression[index])) ?? 0)
            index += 1
        }
        else {
            expressionList.append(Character(String(temporaryValue)))
            expressionList.append(infixExpression[index])
            temporaryValue = 0
        }
        if index == infixExpression.count && symbolsArray.contains(String(infixExpression[index - 1])) != true {
            expressionList.append(Character(String(temporaryValue)))
        }
    }
    return expressionList
}
func postfixEvaluation(postfixExpression: String) -> Double {
    var operandList: [Double] = []
    let expressionList = Array(postfixExpression)
    let numbers = "1234567890"
    for each in expressionList {
        if numbers.contains(each) {
            operandList.append(Double(String(each))!)
        }
        else {
            let secondOperand = operandList.removeLast()
            let firstOperand = operandList.removeLast()
            let result = doCalculation(operators: each, firstOperand: firstOperand, secondOperand: secondOperand)
            operandList.append(result)
        }
    }
    return operandList.removeLast()
}

func doCalculation(operators: Character, firstOperand: Double, secondOperand: Double) -> Double {
    switch operators {
        case "+" :
            return firstOperand + secondOperand
        case "-" :
            return firstOperand - secondOperand
        case "*" :
            return firstOperand * secondOperand
        case "/" :
            return firstOperand / secondOperand
        default : 
            return 0                
    }
} 
let expression = "((3+5)*5+(5-9))/5".replacingOccurrences(of:  " ", with: "")
let postfixConversion: String = infixToPostfix(infixExpression: expression)
let finalResult: Double = postfixEvaluation(postfixExpression: postfixConversion)
print(expression + " = " + "\(finalResult)")