//
//  AppUtilities.swift
//  Nivedita Gupta
//
//  Created by Nivedita Gupta on 03/10/16.
//  Copyright © 2016 Nivedita Gupta. All rights reserved.
//

import UIKit


func trimWhiteSpace(str: String) -> String {
    let trimmedString = str.trimmingCharacters(in: NSCharacterSet.whitespaces)
    return trimmedString
}

func win_width() -> CGFloat {
    let bounds = UIScreen.main.bounds
    let width = bounds.size.width
    return width
}

func win_height() -> CGFloat {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height
    return height
}

let kAppDelegate = UIApplication.shared.delegate as! AppDelegate


//MARK: Toolbar method

extension UIViewController: UITextFieldDelegate {
    func addToolBar(textField: UITextField, title : String){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        let doneButton = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.done, target: self, action: #selector(UIViewController.donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(UIViewController.cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed(){
        view.endEditing(true)
    }
    
    @objc func cancelPressed(){
        view.endEditing(true)
    }
}

extension UIViewController: UITextViewDelegate {
    func addToolBarToTextView(textView: UITextView, title : String){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        let doneButton = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.done, target: self, action: #selector(UIViewController.doneClicked))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(UIViewController.cancelClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textView.delegate = self
        textView.inputAccessoryView = toolBar
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    @objc func cancelClicked(){
        view.endEditing(true)
    }
}

extension UIAlertController {
    static func alertWithTitle(title: String, message: String, buttonTitle: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(action)
        return alertController
    }
}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}


extension String {
    subscript(r: Range<Int>) -> String? {
        get {
            let stringCount = self.count as Int
            if (stringCount < r.upperBound) || (stringCount < r.lowerBound) {
                return nil
            }
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound - r.lowerBound)
            return String(self[(startIndex ..< endIndex)])
        }
    }
    
    func containsAlphabets() -> Bool {
        //Checks if all the characters inside the string are alphabets
        let set = CharacterSet.letters
        return self.utf16.contains( where: {
            guard let unicode = UnicodeScalar($0) else { return false }
            return set.contains(unicode)
        })
    }
}


