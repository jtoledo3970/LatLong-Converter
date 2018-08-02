//
//  DDStructs.swift
//  LatLong Converter
//
//  Created by Jose Toledo on 7/27/18.
//  Copyright © 2018 Toledo's IT Solutions, Inc. All rights reserved.
//

import Foundation

struct DD {
    var dd : Double
    
    init(dd: Double) {
        self.dd = dd
    }
    
    func convertToDMS() -> (d: String, m: String, s: String) {
        let d : Int = Int(dd)
        let m : Int = Int((dd - (Double(d))) * 60)
        let s : Double = ((dd - (Double(d)) - ((Double(m))/60)) * 3600)
        let roundS = Double(round(10000 * s) / 10000)
        return (String(d), String(m), String(roundS))
    }
    
    func convertToDDM() -> (d: String, m: String) {
        let d : Int = Int(dd)
        let m : Int = Int((dd - (Double(d))) * 60)
        let s : Double = ((dd - (Double(d)) - ((Double(m))/60)) * 3600)
        let newMin : Double = Double(Double((m)) + (s/60))
        let roundMin : Double = Double(round(10000 * newMin) / 10000)
        return (String(d), String(roundMin))
    }
}
