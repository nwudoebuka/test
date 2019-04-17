//
//  UiViewControllerExtension.swift
//  Kinwae
//
//  Created by Nwudo Ebuka on 4/17/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit
private var newHeight: Int = 0
extension UIViewController{
    func cornerBorder(_ item:UIView){
        item.layer.masksToBounds = false
        item.layer.shadowOffset = CGSize(width: -1, height: 1)
        item.layer.shadowRadius = 5
        item.layer.shadowOpacity = 0.2
        item.layer.cornerRadius = item.frame.size.width/2
        item.clipsToBounds = false
        
    }
    func colourBorders(_ item:UIView){
        item.layer.borderWidth = 0.5
        item.layer.borderColor = UIColor.lightGray.cgColor
        item.layer.masksToBounds = false
        item.layer.shadowOffset = CGSize(width: -1, height: 1)
        item.layer.shadowRadius = 5
        item.layer.shadowOpacity = 0.2
        item.clipsToBounds = false
        
    }
    
    
    func adjustOriginOnKeyboardShow(vc: UIViewController, adjustmentHeight: Int) {
        
        guard adjustmentHeight > 0 else {
            return
        }
        
        newHeight = adjustmentHeight
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                //self.view.frame.origin.y -= keyboardSize.height
                self.view.frame.origin.y -= CGFloat(newHeight)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func Done()->UIView{
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        
        toolBar.barTintColor = customUIColorLightGray()
        toolBar.tintColor = .white
        toolBar.backgroundColor = customUIColorLightGray()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(UIViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func customCGColorGray()->CGColor{
        
        let color = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1).cgColor
        
        return color
    }
    func customUIColorLightGray()->UIColor{
        
        let color = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        
        return color
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
   
}
