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
    
    var operand:String = ""
    var secondOperand:String = ""
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
            operand = String(0 - Double(operand)!)
            calculatorDisplayLabel.text = String(operand)
        } else{
            secondOperand = String(0 - Double(secondOperand)!)
            calculatorDisplayLabel.text = String(operand)
        }
    }
    @IBAction func equalPressed(_ sender: Any) {
        doOperations(symbolSet: "")
       checkOperand(checkButton: equalButton, symbolSet: "")
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        operand = ""
        secondOperand = ""
        symbolQueued = ""
        calculatorDisplayLabel.text = "0"
        symbolsSetRed()
    }
    
    @IBAction func percentPressed(_ sender: Any) {
        switch symbolQueued {
            
        case "+":
            operand = String(Double(operand)! + (Double(secondOperand)! / 100))
            roundNum(operand: operand)
            secondOperand = ""
            symbolQueued = ""
            symbolsSetRed()
            break
        case "-":
            operand = String(Double(operand)! - (Double(secondOperand)! / 100))
            roundNum(operand: operand)
            secondOperand = ""
            symbolQueued = ""
            symbolsSetRed()
            break
        case "/":
            operand = String(Double(operand)! / (Double(secondOperand)! / 100))
            roundNum(operand: operand)
            secondOperand = ""
            symbolQueued = ""
            symbolsSetRed()
            break
        case "x":
            operand = String(Double(operand)! *  (Double(secondOperand)! / 100))
            roundNum(operand: operand)
            secondOperand = ""
            symbolQueued = ""
            symbolsSetRed()
            break
        default:
            operand = String(Double(operand)! / 100)
            roundNum(operand: operand)
            secondOperand = ""
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
        if operand != "" {
            symbolQueued = symbolSet
            checkButton.backgroundColor = UIColor.purple
        }
        else{
            symbolsSetRed()
        }
        truncateNum(operand: operand)
        calculatorDisplayLabel.text = String(operand)
    }
    
    func doOperations(symbolSet: String){
        switch symbolQueued {
        case "+":
            operand = String(Double(operand)! + Double(secondOperand)!)
            truncateNum(operand: operand)
            secondOperand = ""
            symbolQueued = symbolSet
            symbolsSetRed()
            break
        case "-":
            operand = String(Double(operand)! - Double(secondOperand)!)
            truncateNum(operand: operand)

            secondOperand = ""
            symbolQueued = symbolSet
            symbolsSetRed()
            break
        case "/":
            operand = String(Double(operand)! / Double(secondOperand)!)
            truncateNum(operand: operand)
            secondOperand = ""
            symbolQueued = symbolSet
            symbolsSetRed()
            break
        case "x":
            operand = String(Double(operand)! * Double(secondOperand)!)
            truncateNum(operand: operand)
            secondOperand = ""
            symbolQueued = symbolSet
            symbolsSetRed()
            break
        default:
            symbolsSetRed()
        }
    }
    
    func numPressed(numberInput: String){
        
        if symbolQueued != "" {
            if secondOperand == ""{
                secondOperand = numberInput
            }else{
                secondOperand.append(numberInput)
            }
            calculatorDisplayLabel.text = secondOperand
        } else {
            if operand == ""{
                operand = numberInput
            }else{
                operand.append(numberInput)
            }
            calculatorDisplayLabel.text = operand
        }
    }
    
    func roundNum(operand: String){
        if Double(operand)!.truncatingRemainder(dividingBy: 1.0) == 0 {
            let firstDecimal = operand.index(of: "." ) ?? operand.endIndex
            let firstPart = operand[..<firstDecimal]
            calculatorDisplayLabel.text = String(firstPart)
        }else{
            calculatorDisplayLabel.text = String(operand)
        }
    }
    
    func truncateNum(operand: String){
        if Double(operand)!.truncatingRemainder(dividingBy: 1.0) == 0 {
            let firstPart = String(format: "%.0f", operand)
            calculatorDisplayLabel.text = String(firstPart)
        }else{
            let secondPart = String(format: "%.2f", operand)
            calculatorDisplayLabel.text = String(secondPart)
        }
    }
    
    
}

