//
//  ViewController.swift
//  Assignment3
//
//  Created by DONG JIANG on 10/7/16.
//  Copyright © 2016 DONG JIANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var xValue: UITextField!
    @IBOutlet weak var yValue: UITextField!
    @IBOutlet weak var moveLabel: UILabel!
    @IBAction func button() {
        if let txt = textField.text{
            moveLabel.text = txt
        }
        else{
            print("textFiled is nil")
        }
        if xValue.text == nil || yValue.text == nil{
            print("No need to move")
        }
        else{
            if let x=Int((xValue.text)!),let y=Int((yValue.text)!){
                moveLabel.center = CGPoint(x:x, y:y)
            }
        }
        hideKeyboard()
        
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moveLabel.backgroundColor =
            UIColor.init(colorLiteralRed: 0.3, green: 0.8, blue: 0.7, alpha: 0.3)
        
        textField.keyboardType = .asciiCapable
        textField.keyboardAppearance = .dark
        textField.returnKeyType = UIReturnKeyType.done
        
        xValue.keyboardType = .decimalPad
        yValue.keyboardType = .decimalPad
        
        //Load saved data
        let userDefaults = UserDefaults.standard
        textField.text = userDefaults.string(forKey:"delegate.textField.text")
        xValue.text = userDefaults.string(forKey:"delegate.xValue.text")
        yValue.text = userDefaults.string(forKey:"delegate.yValue.text")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Use one finger to move the moveLabel and update x and y
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        guard touches.count == 1 else{return}
        for uiTouch in touches{
        let touch = uiTouch
            let cgPoint = touch.location(in: self.view)
            moveLabel.center = CGPoint(x:cgPoint.x, y:cgPoint.y)
            xValue.text = String(describing: cgPoint.x)
            yValue.text = String(describing: cgPoint.y)
        }
    }
}

