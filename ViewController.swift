//
//  ViewController.swift
//  Calculator
//
//  Created by Terry on 2017-07-12.
//  Copyright © 2017 Terry Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!    //use let when it is a constant
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func PerformOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        userIsInTheMiddleOfTyping = false
        if let mathematiclSymbol = sender.currentTitle{
            brain.performOperation(mathematiclSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
    
    
    
}

//String? is an option -> set and not set

//set -> get associated value

//Model -> What the app is

//Controller ->  how the model is presented to the user (UI)

//View ->   things the contollers uses (controller's minion)
