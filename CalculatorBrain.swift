//
//  CalculatorBrain.swift
//  Calcululator_23_09
//
//  Created by Koulutus on 23/10/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

/* UI Independent !!! */

import Foundation

struct CalculatorBrain {

    private var accumulator: Double?
    
    mutating func performOperation(_ symbol:String) {
        switch symbol {
        case "pii":
        accumulator = Double.pi
        case "sqrt":
            if let operand = accumulator {
                accumulator = sqrt(operand)
            }
        default:
            break
        }
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
