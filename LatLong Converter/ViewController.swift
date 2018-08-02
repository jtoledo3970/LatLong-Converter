//
//  ViewController.swift
//  LatLong Converter
//
//  Created by Administrator on 7/27/18.
//  Copyright © 2018 Toledo's IT Solutions, Inc. All rights reserved.
//

import UIKit

class ConversionTableViewController: UITableViewController {
    // Outlets
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
        let dd : Double = Double(ddTemp)!
        let ddObject = DD(dd: dd)
        let dmsOutput = ddObject.convertToDMS()
        let ddmOutput = ddObject.convertToDDM()
        dTextField.text = dmsOutput.d
        mTextField.text = dmsOutput.m
        sTextField.text = dmsOutput.s
        degreesTextField.text = ddmOutput.d
        minutesTextField.text = ddmOutput.m
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Coordinate Conversion"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
}

