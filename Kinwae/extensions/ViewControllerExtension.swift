//
//  UiViewControllerExtension.swift
//  Kinwae
//
//  Created by Nwudo Ebuka on 4/17/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit
private var newHeight: Int = 0
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    func activatePicker() {
        Picker.backgroundColor = UIColor.white
        Picker.delegate = self
        self.statetxt.inputView = Picker
        self.citytxt.inputView = Picker
     
    }
 
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if selectedPicker == 1{
        return stateArray.count
        }else{
           return cityArray.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedPicker == 1{
           statetxt.text = stateArray[row]
        }else if selectedPicker == 2{
            citytxt.text = cityArray[row]
        }
   
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if selectedPicker == 1{
            return stateArray[row]
        }else{
            return cityArray[row]
        }
        
    }
    
}
