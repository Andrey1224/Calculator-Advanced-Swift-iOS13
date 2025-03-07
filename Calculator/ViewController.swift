//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    
   private var displayValue: Double {
        get {
            
            guard let number = Double(displayLabel.text!) else {
                fatalError("Happpened with number")
            }
            return number
        }
    set {
        
        displayLabel.text = String(newValue)
    }
    
    
    }
    
    private var calculator = CalculateLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            
            
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("Probleme")
            }
            
           displayValue = result
            
            
        }
        
        
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                
                
            } else {
                
                if numValue == "." {
                    
                    
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
                
            }
            
            
            
        }
        
    }
    
}


