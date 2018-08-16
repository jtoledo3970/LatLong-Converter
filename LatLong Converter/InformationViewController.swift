//
//  InformationViewController.swift
//  LatLong Converter
//
//  Created by Jose M Toledo on 8/1/18.
//  Copyright © 2018 Toledo's IT Solutions, Inc. All rights reserved.
//

import UIKit
import MessageUI
import Eureka
import StoreKit

class InformationViewController: FormViewController, MFMailComposeViewControllerDelegate {
    
    var selection = ""
    var shareLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Information"
        
        let strVersion = Bundle .main .object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        let strBuild = Bundle .main .object(forInfoDictionaryKey: "CFBundleVersion") as? String
        let version = strVersion! + "." + strBuild!
        
        form
            +++ Section("Application Information")
            <<< TextRow() { row in
                row.title = "Application Version"
                row.value = version
                row.disabled = true
            }
            <<< DateTimeRow() { row in
                row.title = "Current Date"
                row.value = Date()
                row.disabled = true
            }
            <<< LabelRow() { row in
                row.title = "2018 © Toledo's IT Solutions, Inc."
            }
        
        +++ Section()
            <<< ButtonRow("Send Feedback") {
                $0.title = $0.tag
                $0.presentationMode = .segueName(segueName: "FeedbackViewControllerSegue", onDismiss: nil)
            }
            <<< ButtonRow("Share this App") {
                $0.title = $0.tag
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.share()
            }
            <<< ButtonRow("Write a Review") {
                $0.title = $0.tag
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.review()
            }
            
            +++ Section("Legal")
            <<< ButtonRow("Terms of Use") {
                $0.title = $0.tag
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.selection = "terms"
                    self?.move()
            }
            <<< ButtonRow("Privacy Policy") {
                $0.title = $0.tag
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.selection = "privacy"
                    self?.move()
            }
            <<< ButtonRow("Disclaimers") {
                $0.title = $0.tag
                
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.selection = "disclaimer"
                    self?.move()
            }
            <<< ButtonRow("Open Source Libraries") {
                $0.title = $0.tag
                
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.selection = "libraries"
                    self?.move()
        }
    }
    
    func move() {
        performSegue(withIdentifier: "LegalSegue", sender: self)
    }
    
    // Share Function
    func share() {
        let message = "Check out this Coordinate Converter"
        if let link = NSURL(string: shareLink) {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    // Review Functionality
    func review() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(URL(string : "itms-apps://itunes.apple.com/us/app/volunteer-hour-tracker/id1263708134?mt=8")!);
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "LegalSegue") {
//            let nextScene = segue.destination as? LegalViewController
            var selectedLegal = selection
//            nextScene?.selection = selectedLegal
        }
    }
}
