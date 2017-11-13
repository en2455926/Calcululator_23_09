//
//  ViewController.swift
//  Calcululator_23_09
//
//  Created by Koulutus on 23/10/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

/* Most important Mac keyboard settings
 
 right alt + 2 = @
 right alt + 8 or 9 = []
 shift + right alt + 8 or 9 = {}
 left cmd + C = copy text
 left cmd + V = paste text
 left cmd + X = delete text
 alt + shift + 7 = \
 
 */


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
        display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    /* Computed value feature in Swift Always tracking value: The value for this property is set automatically whenever the button state changes. For states that do not have a custom title string associated with them, this method returns the title that is currently displayed, which is typically the one associated with the normal state. The value may be nil.
     */
    
    var displayValue: Double  {
        get {
            return Double(display.text!)!
        }
        set {
                display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result

}
}
}
