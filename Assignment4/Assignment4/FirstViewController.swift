///Users/C_Ronaldo/Documents/Xcode/Assignment4/Assignment4/FirstViewController.swift
//  FirstViewController.swift
//  Assignment4
//
//  Created by DONG JIANG on 10/21/16.
//  Copyright © 2016 DONG JIANG. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    var countryAndFoods:Dictionary<String,Array<String>>?
    var country:Array<String>?
    var selectedCountry:String?
    var foods:Array<String>?

    @IBOutlet weak var slider: UISlider!

    @IBAction func slideChange(_ sender: UISlider) {
        print("Slide value: \(sender.value)")
        NSLog("Slider Value %f", sender.value)
        
        let data:Bundle = Bundle.main
        let foodPlist:String? = data.path(forResource: "food", ofType: "plist")
        if foodPlist != nil {
            countryAndFoods = (NSDictionary.init(contentsOfFile: foodPlist!) as! Dictionary)
            country = countryAndFoods?.keys.sorted()
            selectedCountry = country![0]
            foods = countryAndFoods![selectedCountry!]!.sorted()
        }
       let index = ceil(sender.value*Float((foods?.count)!))
       countryPicker.selectRow(Int(index), inComponent: 1, animated: true)
    }

    
    @IBOutlet weak var countryPicker: UIPickerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data:Bundle = Bundle.main
        let foodPlist:String? = data.path(forResource: "food", ofType: "plist")
        if foodPlist != nil {
            countryAndFoods = (NSDictionary.init(contentsOfFile: foodPlist!) as! Dictionary)
            country = countryAndFoods?.keys.sorted()
            selectedCountry = country![0]
            foods = countryAndFoods![selectedCountry!]!.sorted()
        }
        
        if countryPicker != nil {
            countryPicker!.delegate = self
            countryPicker!.dataSource = self
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        guard (country != nil) && foods != nil else { return 0 }
        switch component {
        case 0: return country!.count
        case 1: return foods!.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        guard (country != nil) && foods != nil else { return "None" }
        
        switch component {
        case 0: return country![row]
        case 1: return foods![row]
        default: return "None"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        guard (country != nil) && foods != nil else { return }
        
        if component == 0 {
            selectedCountry = country![row]
            foods = countryAndFoods![selectedCountry!]!.sorted()

            pickerView.reloadComponent(1)
        }
        else if component == 1{
            slider.value = Float(row)/Float(foods!.count-1)
            
            
        }
        print("picked component \(component) row \(row)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

