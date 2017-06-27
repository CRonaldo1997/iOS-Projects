//
//  ThirdViewController.swift
//  Assignment4
//
//  Created by DONG JIANG on 10/22/16.
//  Copyright © 2016 DONG JIANG. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController{
   
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    
    @IBAction func switchChange(_ sender: UISwitch) {
        if sender.isOn { activityView.stopAnimating()
        } else {
            activityView.startAnimating()
        }
    }
  
    @IBAction func showAlertButton(_ sender: UIButton) {
        let controller = UIAlertController(title: "This is an alert",message: "Do you like the iPhone",preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "yes", style: .destructive, handler:{action in print("in Yes")})
        
        let noAction = UIAlertAction(title: "no", style: .default, handler: {action in print("in No")})
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        self.present(controller, animated: true, completion: {print("Done")})
        
    }
    
    
    
    @IBAction func threeSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            showProgress()
        case 1:
            showText()
        case 2:
            showAlert()
        default:
            print ("no more")
        }
    }
    func showProgress(){
        hideKeyboard()
        firstView.isHidden = false
        secondView.isHidden = true
        thirdView.isHidden = true
    }
    
    func showText(){
        firstView.isHidden = true
        secondView.isHidden = false
        thirdView.isHidden = true
    }
    
    func showAlert(){
        hideKeyboard()
        firstView.isHidden = true
        secondView.isHidden = true
        thirdView.isHidden = false
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        showProgress()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
