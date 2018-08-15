//
//  CalcLogic.swift
//  Calculator
//
//  Created by 张洁 on 2018/8/14.
//  Copyright © 2018年 张洁. All rights reserved.
//

import Foundation
enum Operator: Int {
    case Plus = 200, Minus, Multiply, Divide
    case Default = 0
}


class CalcLogic {
    var lastRetainValue: Double
    var opr : Operator
    var isMainLabelTextTemp: Bool
    init() {
        lastRetainValue = 0.0
        opr = .Default
        isMainLabelTextTemp = false
    }
    
    func updateMainLabelString(_ aString: String, buttonTag tag: Int) -> String {
        var string = aString
        
        if isMainLabelTextTemp {
            isMainLabelTextTemp = false
            string = "0"
        }
        let optNumber = tag - 100
        let mainLabelDouble = (string as NSString).doubleValue
        
        if mainLabelDouble == 0 && !isStringContainDecimal(aString: string) {
            return String(optNumber)
        }
        let resultString = string + String(optNumber)
        
        return resultString
    }
    func calculate(_ aString: String, buttonTag tag: Int) -> String {
        let currentValue = (aString as NSString).doubleValue
        switch opr {
        case .Plus:
            lastRetainValue += currentValue
        case .Minus:
            lastRetainValue -= currentValue
        case .Multiply:
            lastRetainValue *= currentValue
        case .Divide:
            if currentValue != 0 {
                lastRetainValue /= currentValue
            } else {
                opr = .Default
                isMainLabelTextTemp = true
                return "错误"
            }
        default:
            lastRetainValue = currentValue
        }
        opr = Operator(rawValue: tag)!
        let resultString = NSString(format: "%g", lastRetainValue)
        isMainLabelTextTemp = true
        return resultString as String
    }
    
    func isStringContainDecimal(aString: String) -> Bool {
        for ch in aString {
            if ch == "." {
                return true
            }
        }
        return false
    }
    
    func clear() {
        lastRetainValue = 0.0
        isMainLabelTextTemp = false
        opr = .Default
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            <#code#>
        }
    }
}
