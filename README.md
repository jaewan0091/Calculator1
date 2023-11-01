import SwiftUI

struct ContentView: View {
    @State private var currentInput = "0"
    @State private var firstOperand: Double? = nil
    @State private var currentOperator: String? = nil
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 301, height: 75)
                    .foregroundColor(.blue)
                    .overlay(
                        Text(currentInput)
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundColor(.white))
                }.padding(10)
            
            HStack {
                
                Button(action: {
                    currentInput = "0"
                    firstOperand = nil
                    currentOperator = nil
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 70, height: 70)
                        .foregroundColor(.yellow)
                        .overlay(
                            Text("C")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.white))
                    OperatorButton(operatorSymbol: "±", currentInput: $currentInput, firstOperand: $firstOperand, currentOperator: $currentOperator)
                    OperatorButton(operatorSymbol: "%", currentInput: $currentInput, firstOperand: $firstOperand, currentOperator: $currentOperator)
                    OperatorButton(operatorSymbol: "÷", currentInput: $currentInput, firstOperand: $firstOperand, currentOperator: $currentOperator)
                }
            }
            
            HStack {
                NumberButton(number: "7", currentInput: $currentInput)
                NumberButton(number: "8", currentInput: $currentInput)
                NumberButton(number: "9", currentInput: $currentInput)
                OperatorButton(operatorSymbol: "×", currentInput: $currentInput, firstOperand: $firstOperand, currentOperator: $currentOperator)
            }
            
            HStack {
                NumberButton(number: "4", currentInput: $currentInput)
                NumberButton(number: "5", currentInput: $currentInput)
                NumberButton(number: "6", currentInput: $currentInput)
                OperatorButton(operatorSymbol: "-", currentInput: $currentInput, firstOperand: $firstOperand, currentOperator: $currentOperator)
            }
            
            HStack {
                NumberButton(number: "1", currentInput: $currentInput)
                NumberButton(number: "2", currentInput: $currentInput)
                NumberButton(number: "3", currentInput: $currentInput)
                OperatorButton(operatorSymbol: "+", currentInput: $currentInput, firstOperand: $firstOperand, currentOperator: $currentOperator)
            }
            
            HStack {
                NumberButton(number: "0", currentInput: $currentInput)
                NumberButton(number: "00", currentInput: $currentInput)
                NumberButton(number: ".", currentInput: $currentInput)
                OperatorButton(operatorSymbol: "=", currentInput: $currentInput, firstOperand: $firstOperand, currentOperator: $currentOperator)
            }
        }
    }
}

struct NumberButton: View {
    let number: String
    @Binding var currentInput: String
    
    var body: some View {
        Button(action: {
            if currentInput == "0" {
                currentInput = number
            } else {
                currentInput += number
            }
        }) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 70, height: 70)
                .foregroundColor(.mint)
                .overlay(
                    Text(number)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white))
            
        }
    }
}

struct OperatorButton: View {
    let operatorSymbol: String
    @Binding var currentInput: String
    @Binding var firstOperand: Double?
    @Binding var currentOperator: String?
    
    var body: some View {
        
        Button(action: {
            if operatorSymbol == "=" {
                if let first = firstOperand, let second = Double(currentInput) {
                    switch currentOperator {
                    case "+":
                        currentInput = String(first + second)
                    case "-":
                        currentInput = String(first - second)
                    case "×":
                        currentInput = String(first * second)
                    case "÷":
                        if second != 0 {
                            currentInput = String(first / second)
                        } else {
                            currentInput = "Error"
                        }
                    case "%":
                        if second != 0 {
                            currentInput = String(first.truncatingRemainder(dividingBy: second))
                        } else {
                            currentInput = "Error"
                        }
                    default:
                        break
                    }
                    firstOperand = nil
                }
            } else if operatorSymbol == "%" {
                if let number = Double(currentInput) {
                    currentInput = String(number * 0.01)
                }
            } else if operatorSymbol == "±" {
                if let number = Double(currentInput) {
                    currentInput = String(-1 * number)
                }
            } else {
                if operatorSymbol == "." {
                    if !currentInput.contains(".") {
                        currentInput += "."
                    }
                } else {
                    firstOperand = Double(currentInput)
                    currentInput = ""
                    currentOperator = operatorSymbol
                }
            }
        }) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 70, height: 70)
                .foregroundColor(.orange)
                .overlay(
                    Text(operatorSymbol)
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .foregroundColor(.white))
        }
    }
}
#Preview {
    ContentView()
}
