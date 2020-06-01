/*Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "(2*3)+3*5")
Here the evaluation will happen based on precedence order as = (2*3)+3*5
                                                             = 6+3*5
                                                             = 6+15
                                                             = 21 */
import Foundation
let expression = Array("1+2.2".replacingOccurrences(of:  " ", with: ""))  //remove the whitespaces
let symbolsArray = ["+","-","*","/","(",")",".","^"]

//creating infixExpression
func createExpressionList(infixExpression: [Character]) -> [String] {
    var temporaryValue = 0
    var flag = 0
    var expressionList: [String] = []
    for var index in 0..<infixExpression.count {
        if symbolsArray.contains(String(infixExpression[index])) != true {
            temporaryValue *= 10
            temporaryValue += (Int(String(infixExpression[index])) ?? 0)
            flag = 1            
        }
        else {
            if flag == 1 {
                expressionList.append(String(temporaryValue))
            }
            expressionList.append(String(infixExpression[index]))
            temporaryValue = 0
            flag = 0
            if String(infixExpression[index]) == "." , String(infixExpression[index + 1]) == "0" {
                expressionList.append(String(infixExpression[index + 1]))
            }
        }
        if index == infixExpression.count - 1 && symbolsArray.contains(String(infixExpression[index])) != true {
            expressionList.append(String(temporaryValue))
        }
    }
    return expressionList
}

func eliminateFloatProblem(_ expression: inout [String]) -> [String] {
    for each in 0..<(expression.count - 1) {
        if expression[each] == "." && expression[each + 1] != "0" {
            expression[each - 1] = expression[each - 1] + expression[each] + expression[each + 1]
            expression.remove(at: each)
            expression.remove(at: each)
        }
        else if expression[each] == "." && expression[each + 1] == "0" {
            expression[each - 1] = expression[each - 1] + expression[each] + expression[each + 1] + expression[each + 2]
            expression.remove(at: each)
            expression.remove(at: each)
            expression.remove(at: each)
        }
    }
    return expression
}
//convert infix to postfix
func infixToPostfix(infixExpression: [Character]) -> Double {
    var precedence = ["*": 3, "/": 3, "+": 2, "-": 2, "(": 1]
    var operatorList: [String] = []  //store operators
    var postfixList: [String] = []   //store numbers
    var expressionList: [String] = Array(createExpressionList(infixExpression: infixExpression)) //calls function to separate the expression correctly
    if expressionList.contains(".") {
        expressionList = eliminateFloatProblem(&expressionList)
    }
    for each in expressionList {
        if symbolsArray.contains(each) != true {
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
    return postfixList
}
//evaluation of postfix expression
func postfixEvaluation(postfixExpression: [String]) -> Double {
    var operandList: [Double] = []
    // let expressionList = Array(postfixExpression)
    let symbols: [String] = ["+","-","*","/","(",")","."]
    for each in postfixExpression {
        if symbols.contains(each) != true {
            operandList.append(Double(String(each)) ?? 0)
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

//perform calculations based on  operators
func doCalculation(operators: String, firstOperand: Double, secondOperand: Double) -> Double {
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
let finalResult: Double = infixToPostfix(infixExpression: expression)
print(String(expression) + "=" + "\(finalResult)")
