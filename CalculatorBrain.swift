//
//  CalculatorBrain.swift
//  Calcululator_23_09
//
//  Created by Koulutus on 23/10/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

/* UI Independent !!! */

import Foundation


func changeSign(operand: Double) -> Double {
    return -operand
}

func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}

struct CalculatorBrain {

    private var accumulator: Double?
 
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary <String,Operation> = [
        "pii" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "sqrt" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "+/-" : Operation.unaryOperation(changeSign),
        "*" : Operation.binaryOperation(multiply),
        "=" : Operation.equals
        ]
    
    mutating func performOperation(_ symbol:String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let Value):
                accumulator = Value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case . binaryOperation(let function):
                break
            case.equals:
                break
            }
        }
}

    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }

}
