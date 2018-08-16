//
//  FeedbackViewController.swift
//  LatLong Converter
//
//  Created by Jose M Toledo on 8/1/18.
//  Copyright © 2018 Toledo's IT Solutions, Inc. All rights reserved.
//

import UIKit
import Eureka
import MessageUI
import StoreKit

class FeedbackViewController: FormViewController, MFMailComposeViewControllerDelegate{
    
    var finalBody = ""
    var selection = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Send Feedback"
        
        // Back Button
        let barButton = UIBarButtonItem()
        barButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = barButton
        
        var specs = true
        
        let strVersion = Bundle .main .object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        let strBuild = Bundle .main .object(forInfoDictionaryKey: "CFBundleVersion") as? String
        let version = strVersion! + "." + strBuild!
        
        var systemVersion = UIDevice.current.systemVersion;
        var device = UIDevice.current.modelName
        
        form
            +++ Section("Type of Feedback")
            <<< TextAreaRow() { row in
                row.tag = "feedback"
                row.placeholder = "Enter your feedback here"
                row.textAreaHeight = .dynamic(initialTextViewHeight: 110)
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                }
                .onRowValidationChanged { cell, row in
                    let rowIndex = row.indexPath!.row
                    while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                        row.section?.remove(at: rowIndex + 1)
                    }
                    if !row.isValid {
                        for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                            let labelRow = LabelRow() {
                                $0.title = validationMsg
                                $0.cell.height = { 30 }
                                $0.cell.contentView.backgroundColor = UIColor.red
                            }
                            row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                        }
                    }
            }
            
            +++ Section("Device Information")
            <<< DateTimeRow("Date and Time") {
                $0.title = $0.tag
                $0.value = Date()
            }
            <<< SwitchRow("specificationRowTag") { row in
                row.title = "Include Device Specifications"
                row.value = true
                } .onChange() { row in
                    if (row.value == true) {
                        specs = true
                    } else if(row.value == false) {
                        specs = false
                    }
            }
            
            <<< TextRow() { row in
                row.hidden = Condition.function(["specificationRowTag"], { form in
                    return !((form.rowBy(tag: "specificationRowTag") as? SwitchRow)?.value ?? false)
                })
                row.title = "Device"
                row.value = device
                row.disabled = true
                
            }
            <<< TextRow() { row in
                row.hidden = Condition.function(["specificationRowTag"], { form in
                    return !((form.rowBy(tag: "specificationRowTag") as? SwitchRow)?.value ?? false)
                })
                row.title = "iOS Version"
                row.value = systemVersion
                row.disabled = true
                
            }
            <<< TextRow() { row in
                row.hidden = Condition.function(["specificationRowTag"], { form in
                    return !((form.rowBy(tag: "specificationRowTag") as? SwitchRow)?.value ?? false)
                })
                row.title = "Application Version"
                row.value = version
                row.disabled = true
                
            }
            +++ Section()
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Send"
                }
                .onCellSelection { [weak self] (cell, row) in
                    let row: TextAreaRow? = self?.form.rowBy(tag: "feedback")
                    let value = row?.value
                    print(value)
                    if (value != nil) {
                        row?.section?.form?.validate()
                        if (specs == true) {
                            self?.finalBody = value! + "\r\n" + "\r\n" + "This is my device information:" + "\r\n" + "Device: " + device + "\r\n" + "iOS Version: " + systemVersion + "\r\n" + "This is the app version: " + version
                        } else if (specs == false) {
                            self?.finalBody = value!
                        }
                        
//                        self!.sendMail()
                    } else if (value == nil){
//                        SCLAlertView().showWarning("You forgot something", subTitle: "Please enter data into every field. Thank you.")
                    }
            }
            +++ Section("We take your privacy seriously")
            <<< ButtonRow("Privacy Policy") {
                $0.title = $0.tag
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.selection = "privacy"
//                    self?.move()
        }
    }
}
