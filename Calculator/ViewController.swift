//
//  ViewController.swift
//  Calculator
//
//  Created by 张洁 on 2018/8/14.
//  Copyright © 2018年 张洁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var logic : CalcLogic!

    @IBOutlet var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "0"
        logic = CalcLogic()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        logic = nil
    }

    @IBAction func numberButtonPressed(_ sender: AnyObject) {
        let btn : UIButton = sender as! UIButton
        mainLabel.text = logic.updateMainLabelString(mainLabel.text!, buttonTag: btn.tag)
        
    }
    
    @IBAction func decimalPressed(_ sender: AnyObject) {
        if logic.isStringContainDecimal(aString: mainLabel.text!) == false {
            let string = mainLabel.text! + "."
            mainLabel.text = string
            
        }
    }
    
    @IBAction func clearPressed(_ sender: AnyObject) {
        mainLabel.text = "0"
        logic.clear()
    }
    
    @IBAction func operandPressed(_ sender: Any) {
        let btn : UIButton = sender as! UIButton
        mainLabel.text = logic.calculate(mainLabel.text!, buttonTag: btn.tag)
        
    }
    
    @IBAction func equalPressed(_ sender: Any) {
        let btn : UIButton = sender as! UIButton
        mainLabel.text = logic.calculate(mainLabel.text!, buttonTag: btn.tag)
    }
}

