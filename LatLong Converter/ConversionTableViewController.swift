//
//  ViewController.swift
//  LatLong Converter
//
//  Created by Administrator on 7/27/18.
//  Copyright © 2018 Toledo's IT Solutions, Inc. All rights reserved.
//

import UIKit

class ConversionTableViewController: UIViewController {
    // Outlets
    
    @IBOutlet weak var ddCard: UIView!
    @IBOutlet weak var dmsCard: UIView!
    @IBOutlet weak var ddmCard: UIView!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var decimalDegreeLabel: UITextField!
    @IBOutlet weak var dTextField: UITextField!
    @IBOutlet weak var mTextField: UITextField!
    @IBOutlet weak var sTextField: UITextField!
    @IBOutlet weak var degreesTextField: UITextField!
    @IBOutlet weak var minutesTextField: UITextField!
    
    var d = 0.0
    var m = 0.0
    var s = 0.0
    var degrees = 0.0
    var minutes = 0.0
    
    @IBAction func ddEdit(_ sender: Any) {
        let ddTemp = decimalDegreeLabel.text!
        if let dd : Double =  Double(ddTemp) {
            let ddObject = DD(dd: dd)
            let dmsOutput = ddObject.convertToDMS()
            let ddmOutput = ddObject.convertToDDM()
            dTextField.text = dmsOutput.d
            mTextField.text = dmsOutput.m
            sTextField.text = dmsOutput.s
            degreesTextField.text = ddmOutput.d
            minutesTextField.text = ddmOutput.m
        } else { clear() }
    }
    @IBAction func dEdit(_ sender: Any) {
        if ((dTextField.text ?? "").isEmpty) {
            d = 0.0
        } else {
            d = Double(dTextField.text!)!
        }
        if ((mTextField.text ?? "").isEmpty) {
            m = 0.0
        } else {
            m = Double(mTextField.text!)!
        }
        if ((sTextField.text ?? "").isEmpty) {
            s = 0.0
        } else {
            s = Double(sTextField.text!)!
        }
        let dmsObject = DMS(d: d, m: m, s: s)
        let dmsOutput = dmsObject.convertToDD()
        let ddmOutput = dmsObject.convertToDDM()
        decimalDegreeLabel.text = dmsOutput
        degreesTextField.text = ddmOutput.d
        minutesTextField.text = ddmOutput.m
    }
    @IBAction func mEdit(_ sender: Any) {
        if ((dTextField.text ?? "").isEmpty) {
            d = 0.0
        } else {
            d = Double(dTextField.text!)!
        }
        if ((mTextField.text ?? "").isEmpty) {
            m = 0.0
        } else {
            m = Double(mTextField.text!)!
        }
        if ((sTextField.text ?? "").isEmpty) {
            s = 0.0
        } else {
            s = Double(sTextField.text!)!
        }
        let dmsObject = DMS(d: d, m: m, s: s)
        let dmsOutput = dmsObject.convertToDD()
        let ddmOutput = dmsObject.convertToDDM()
        decimalDegreeLabel.text = dmsOutput
        degreesTextField.text = ddmOutput.d
        minutesTextField.text = ddmOutput.m
    }
    @IBAction func sEdit(_ sender: Any) {
        if ((dTextField.text ?? "").isEmpty) {
            d = 0.0
        } else {
            d = Double(dTextField.text!)!
        }
        if ((mTextField.text ?? "").isEmpty) {
            m = 0.0
        } else {
            m = Double(mTextField.text!)!
        }
        if ((sTextField.text ?? "").isEmpty) {
            s = 0.0
        } else {
            s = Double(sTextField.text!)!
        }
        let dmsObject = DMS(d: d, m: m, s: s)
        let dmsOutput = dmsObject.convertToDD()
        let ddmOutput = dmsObject.convertToDDM()
        decimalDegreeLabel.text = dmsOutput
        degreesTextField.text = ddmOutput.d
        minutesTextField.text = ddmOutput.m
    }
    @IBAction func degreesEdit(_ sender: Any) {
        if ((degreesTextField.text ?? "").isEmpty) {
            degrees = 0.0
        } else {
            degrees = Double(degreesTextField.text!)!
        }
        if ((minutesTextField.text ?? "").isEmpty) {
            minutes = 0.0
        } else {
            minutes = Double(minutesTextField.text!)!
        }
        let ddm = DDM(d: degrees, m: minutes)
        let dmsOutput = ddm.convertToDMS()
        let ddmOutput = ddm.convertToDD()
        dTextField.text = dmsOutput.d
        mTextField.text = dmsOutput.m
        sTextField.text = dmsOutput.s
        decimalDegreeLabel.text = ddmOutput
    }
    @IBAction func minutesEdit(_ sender: Any) {
        if ((degreesTextField.text ?? "").isEmpty) {
            degrees = 0.0
        } else {
            degrees = Double(degreesTextField.text!)!
        }
        if ((minutesTextField.text ?? "").isEmpty) {
            minutes = 0.0
        } else {
            minutes = Double(minutesTextField.text!)!
        }
        let ddm = DDM(d: degrees, m: minutes)
        let dmsOutput = ddm.convertToDMS()
        let ddmOutput = ddm.convertToDD()
        dTextField.text = dmsOutput.d
        mTextField.text = dmsOutput.m
        sTextField.text = dmsOutput.s
        decimalDegreeLabel.text = ddmOutput
    }
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        decimalDegreeLabel.resignFirstResponder()
        dTextField.resignFirstResponder()
        mTextField.resignFirstResponder()
        sTextField.resignFirstResponder()
        degreesTextField.resignFirstResponder()
        minutesTextField.resignFirstResponder()
    }
    @IBAction func resetButtonTapped(_ sender: Any) {
        clear()
    }
    
    func clear() {
        decimalDegreeLabel.text = nil
        dTextField.text = nil
        mTextField.text = nil
        sTextField.text = nil
        degreesTextField.text = nil
        minutesTextField.text = nil
        self.view.frame.origin.y = 0
    }
    
    func setupViews() {
        ddCard.layer.cornerRadius = 8
        ddCard.layer.masksToBounds = true
        dmsCard.layer.cornerRadius = 8
        dmsCard.layer.masksToBounds = true
        dmsCard.layer.borderWidth = 1
        dmsCard.layer.borderColor = UIColor.tcSeafoamGreen.cgColor
        ddmCard.layer.cornerRadius = 8
        ddmCard.layer.masksToBounds = true
        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.tcSeafoamGreen.cgColor

    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
        self.view.frame.origin.y = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        title = "Coordinate Conversion"
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
}

