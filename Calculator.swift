/*Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "(2*3)+3*5")
Here the evaluation will happen based on precedence order as = (2*3)+3*5
                                                             = 6+3*5
                                                             = 6+15
                                                             = 21 */
import Foundation
let expression = Array("22.2+3".replacingOccurrences(of:  " ", with: ""))  //remove the whitespaces
let symbolsArray = ["+","-","*","/","(",")","^"]

//creating infixExpression
func createExpressionList(for infixExpression: [Character]) -> [String] {
    var temporaryValue = 0
    var infixExpression = Array(infixExpression)
    var flag = 0
    var index = 0
    var expressionList: [String] = []
    while index < infixExpression.count  {
        var startingIndex = 0
        if index < infixExpression.count - 1  {
            if infixExpression[index + 1] == "." {
                startingIndex = index 
                while index < infixExpression.count - 1 {
                    if symbolsArray.contains(String(infixExpression[index])) != true {
                        index += 1
                    }
                    else if symbolsArray.contains(String(infixExpression[index])) {
                        index -= 1
                        break
                    }
                    else {
                        index += 1
                        break
                    }
                }
                if flag == 1 {
                    temporaryValue *= 10
                    temporaryValue += Int(String(infixExpression[startingIndex])) ?? 0
                }
                else {
                    temporaryValue = Int(String(infixExpression[startingIndex])) ?? 0
                }
                let temporaryString = String(temporaryValue) + String(infixExpression[startingIndex + 1...index])
                expressionList.append(temporaryString)
                temporaryValue = 0 
                flag = 0 
            
            }
            else if symbolsArray.contains(String(infixExpression[index])) != true {
                temporaryValue *= 10
                temporaryValue += (Int(String(infixExpression[index])) ?? 0)
                flag = 1
            }
            else {
                if flag == 1 {
                    expressionList.append(String(temporaryValue))
                }
                if infixExpression[index] == "(" && index != 0  {
                    if symbolsArray.contains(String(infixExpression[index - 1])) != true {
                        expressionList.append("*")
                    }
                }
                expressionList.append(String(infixExpression[index]))
                if infixExpression[index] == ")" && index < infixExpression.count {
                    if  infixExpression[index + 1] == "(" || symbolsArray.contains(String(infixExpression[index + 1])) != true{
                        expressionList.append("*")
                    }
                }
                temporaryValue = 0
                flag = 0
            }
        }
        else {
            if index <= infixExpression.count - 1   {
                if flag == 1 && symbolsArray.contains(String(infixExpression[index])) {
                    expressionList.append(String(temporaryValue))
                    expressionList.append(String(infixExpression[index]))
                }
                else if flag == 1 {
                    temporaryValue = temporaryValue * 10 + (Int(String(infixExpression[index])) ?? 0)
                    expressionList.append(String(temporaryValue))
                }
                else {
                    expressionList.append(String(infixExpression[index]))
                }
                
            }
        }
        index = index + 1
    }
    return expressionList  
}
//convert infix to postfix
func performCalculationByConvertingInfixToPostfix(for infixExpression: [Character]) -> Double {
    var precedence = ["*": 3, "/": 3, "+": 2, "-": 2, "(": 1]
    var operatorList: [String] = []  //store operators
    var postfixList: [String] = []   //store numbers
    let expressionList: [String] = Array(createExpressionList(for: infixExpression)) //calls function to separate the expression correctly
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
    return postfixEvaluation(for: postfixList)
}
//evaluation of postfix expression
func postfixEvaluation(for postfixExpression: [String]) -> Double {
    var operandList: [Double] = []
    let symbols: [String] = ["+","-","*","/","(",")","."]
    let symbolsBasedValues = ["+": 0.0, "-": 0.0, "*": 1.0, "/": 1.0]
    var result = 0.0
    for each in postfixExpression {
        if symbols.contains(each) != true {
            operandList.append(Double(String(each)) ?? 0)
        }
        else {
            if operandList.count == 1 {
                result = performArithmeticOperation(of: each, for: operandList.removeLast(),and: symbolsBasedValues[each]!)
            }
            else {
                result = performArithmeticOperation(of: each, for: operandList.removeLast(),and: operandList.removeLast())
            }
            operandList.append(result)
        }
    }
    return operandList.removeLast()
}

//perform calculations based on  operators
func performArithmeticOperation(of operators: String,for secondOperand: Double,and firstOperand: Double) -> Double {
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
let finalResult: Double = performCalculationByConvertingInfixToPostfix(for: expression)
print(String(expression) + "=" + "\(finalResult)")
