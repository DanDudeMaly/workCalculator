//
//  ViewController.swift
//  Calculator
//
//  Created by Dan on 21/2/18.
//  Copyright © 2018 Dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    var operand:Double = 0.0
    var secondOperand:Double = 0.0
    var symbolQueued:String = ""
    var lastPressed:String = ""
    
    @IBOutlet weak var moduloButton: UIButton!
    @IBOutlet weak var negativeButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var calculatorDisplayLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorDisplayLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func decimalPressed(_ sender: Any) {
        
    }
    @IBAction func addPressed(_ sender: Any) {
        doOperations(symbolSet: "+")
        checkOperand(checkButton: plusButton, symbolSet: "+")
    }
    
    @IBAction func minusPressed(_ sender: Any) {
        doOperations(symbolSet: "-")
        checkOperand(checkButton: minusButton, symbolSet: "-")
    }
    
    @IBAction func multiplyPressed(_ sender: Any) {
        doOperations(symbolSet: "x")
        checkOperand(checkButton: multiplyButton, symbolSet: "x")
    }
    
    @IBAction func dividePressed(_ sender: Any) {
        doOperations(symbolSet: "/")
        checkOperand(checkButton: divideButton, symbolSet: "/")
    }
    
   
    @IBAction func negativePressed(_ sender: Any) {
        if symbolQueued == "" {
            operand = 0 - operand
            calculatorDisplayLabel.text = String(operand)
        } else{
            secondOperand = 0 - secondOperand
            calculatorDisplayLabel.text = String(operand)
        }
    }
    @IBAction func equalPressed(_ sender: Any) {
        doOperations(symbolSet: "")
       checkOperand(checkButton: equalButton, symbolSet: "")
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        operand = 0
        secondOperand = 0
        symbolQueued = ""
        calculatorDisplayLabel.text = "0"
        symbolsSetRed()
    }
    
    @IBAction func percentPressed(_ sender: Any) {
        switch symbolQueued {
        case "+":
            operand = operand + (operand * (secondOperand / 100))
            calculatorDisplayLabel.text = String(operand)
            secondOperand = 0
            symbolQueued = ""
            symbolsSetRed()
            break
        case "-":
            operand = operand - (operand * (secondOperand / 100))
            calculatorDisplayLabel.text = String(operand)
            secondOperand = 0
            symbolQueued = ""
            symbolsSetRed()
            break
        case "/":
            operand = operand * (operand * (secondOperand / 100))
            calculatorDisplayLabel.text = String(operand)
            secondOperand = 0
            symbolQueued = ""
            symbolsSetRed()
            break
        case "x":
            operand = operand / (operand * (secondOperand / 100))
            calculatorDisplayLabel.text = String(operand)
            secondOperand = 0
            symbolQueued = ""
            symbolsSetRed()
            break
        default:
            operand = operand / 100
            calculatorDisplayLabel.text = String(operand)
            secondOperand = 0
            symbolQueued = ""
            symbolsSetRed()
        }
    }
    
    @IBAction func zeroPressed(_ sender: Any) {
        numPressed(numberInput: "0")
    }
    
    @IBAction func onePressed(_ sender: Any) {
        numPressed(numberInput: "1")
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        numPressed(numberInput: "2")
    }
    
    @IBAction func threePressed(_ sender: Any) {
        numPressed(numberInput: "3")
    }
    @IBAction func fourPressed(_ sender: Any) {
        numPressed(numberInput: "4")
    }
    @IBAction func fivePressed(_ sender: Any) {
        numPressed(numberInput: "5")
    }
    @IBAction func sixPressed(_ sender: Any) {
        numPressed(numberInput: "6")
    }
    @IBAction func sevenPressed(_ sender: Any) {
        numPressed(numberInput: "7")
    }
    @IBAction func eightPressed(_ sender: Any) {
        numPressed(numberInput: "8")
    }
    @IBAction func ninePressed(_ sender: Any) {
        numPressed(numberInput: "9")
    }
    
    func symbolsSetRed() {
        plusButton.backgroundColor = UIColor.red
        minusButton.backgroundColor = UIColor.red
        multiplyButton.backgroundColor = UIColor.red
        divideButton.backgroundColor = UIColor.red
        equalButton.backgroundColor = UIColor.red
    }
    
    func checkOperand(checkButton: UIButton, symbolSet: String){
        if operand != 0 {
            symbolQueued = symbolSet
            checkButton.backgroundColor = UIColor.purple
        }
        else{
            symbolsSetRed()
        }
        operand = Double(String(format: "%.2f", operand))!
        if operand.truncatingRemainder(dividingBy: 1.0) == 0 {
            calculatorDisplayLabel.text = String(format: "%.0f", operand)
        }else{
            calculatorDisplayLabel.text = String(operand)
        }
    }
    
    func doOperations(symbolSet: String){
        switch symbolQueued {
        case "+":
            operand = operand + secondOperand
            if operand.truncatingRemainder(dividingBy: 1.0) == 0 {
                calculatorDisplayLabel.text = String(format: "%.0f", operand)
            }else{
                calculatorDisplayLabel.text = String(operand)
            }
            secondOperand = 0
            symbolQueued = symbolSet
            symbolsSetRed()
            break
        case "-":
            operand = operand - secondOperand
            if operand.truncatingRemainder(dividingBy: 1.0) == 0 {
                calculatorDisplayLabel.text = String(format: "%.0f", operand)
            }else{
                calculatorDisplayLabel.text = String(operand)
            }
            secondOperand = 0
            symbolQueued = symbolSet
            symbolsSetRed()
            break
        case "/":
            operand = operand / secondOperand
            if operand.truncatingRemainder(dividingBy: 1.0) == 0 {
                calculatorDisplayLabel.text = String(format: "%.0f", operand)
            }else{
                calculatorDisplayLabel.text = String(operand)
            }
            secondOperand = 0
            symbolQueued = symbolSet
            symbolsSetRed()
            break
        case "x":
            operand = operand * secondOperand
            if operand.truncatingRemainder(dividingBy: 1.0) == 0 {
                calculatorDisplayLabel.text = String(format: "%.0f", operand)
            }else{
                calculatorDisplayLabel.text = String(operand)
            }
            secondOperand = 0
            symbolQueued = symbolSet
            symbolsSetRed()
            break
        default:
            symbolsSetRed()
        }
    }
    
    func numPressed(numberInput: String){
        
        if symbolQueued != "" { //check if a symbol has been pressed
            if (String(secondOperand).contains(".")){
                secondOperand = Double(String(secondOperand) + numberInput)!
                calculatorDisplayLabel.text = String(secondOperand)
            }
            secondOperand = Double(String(String(format: "%.0f", secondOperand)) + numberInput)! //as operand vars use Double this rounds to no decimal places then adds the value of the button pressed. i.e 0.0 + 8 goes to 8 instead of 0.08
            if secondOperand.truncatingRemainder(dividingBy: 1.0) == 0 { //if second operand is able to divide by 1 and have no remainder, ie a whole number, then remove the decimal place from the Double and present. ie 48.0 becomes 48
                calculatorDisplayLabel.text = String(format: "%.0f", secondOperand)
            }else{
                calculatorDisplayLabel.text = String(secondOperand) //if the number is not a whole number, then display the decimal points
            }
            
        } else{
            operand = Double(String(String(format: "%.0f", operand)) + numberInput)!
            if operand.truncatingRemainder(dividingBy: 1.0) == 0 {
                calculatorDisplayLabel.text = String(format: "%.0f", operand)
            }else{
                calculatorDisplayLabel.text = String(operand)
            }
            
        }
    }
    
    
}

