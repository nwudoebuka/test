//
//  ViewController.swift
//  Kinwae
//
//  Created by Nwudo Ebuka on 4/17/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    let Picker = UIPickerView()
    @IBOutlet var branchtxt: FloatLabelTextField!
    @IBOutlet var addresstxt: FloatLabelTextField!
    @IBOutlet var citytxt: FloatLabelTextField!
    @IBOutlet var statetxt: FloatLabelTextField!
    @IBOutlet var phonetxt: FloatLabelTextField!
    @IBOutlet var countrycodetxt: FloatLabelTextField!
    @IBOutlet var emailtxt: FloatLabelTextField!
    @IBOutlet var chatVholder: UIView!
    @IBOutlet var pageV3: UIView!
    @IBOutlet var pageV2b: UIView!
    @IBOutlet var pagV1: UIView!
    @IBOutlet var pageV2a: UIView!
    @IBOutlet var emailvholder: UIView!
    @IBOutlet var phonevholder: UIView!
    let cityArray = ["Aba","Awka","Portharcourt","Ikeja"]
    let stateArray = ["Abia","Anambra","Rivers","Lagos"]
    let keyboardAdjustmentHeight = 150
    var selectedPicker = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        statetxt.delegate = self
        citytxt.delegate = self
        activatePicker()
       colourBorders(emailvholder)
        colourBorders(phonevholder)
        cornerBorder(pagV1)
        cornerBorder(pageV2a)
        cornerBorder(pageV2b)
        cornerBorder(pageV3)
        cornerBorder(chatVholder)
        countrycodetxt.keyboardType = .numberPad
        phonetxt.keyboardType = .numberPad
        adjustOriginOnKeyboardShow(vc: self,adjustmentHeight: keyboardAdjustmentHeight)
        emailtxt.inputAccessoryView = Done()
        phonetxt.inputAccessoryView = Done()
        statetxt.inputAccessoryView = Done()
        citytxt.inputAccessoryView = Done()
        addresstxt.inputAccessoryView = Done()
        hideKeyboardWhenTappedAround()
    
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == statetxt{
            selectedPicker = 1
            Picker.reloadAllComponents()
        }else if textField == citytxt{
            selectedPicker = 2
            Picker.reloadAllComponents()
        }
    }
}

