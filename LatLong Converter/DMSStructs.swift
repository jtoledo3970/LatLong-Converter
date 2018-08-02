//
//  DMSStructs.swift
//  LatLong Converter
//
//  Created by Jose Toledo on 7/27/18.
//  Copyright © 2018 Toledo's IT Solutions, Inc. All rights reserved.
//

import Foundation

struct DMS {
    var d : Double
    var m : Double
    var s : Double
    
    init(d: Double, m: Double, s: Double) {
        self.d = d
        self.m = m
        self.s = s
    }
    
    func convertToDD() -> String {
        let dd = d + (m/60) + (s/3600)
        let roundDD = Double(round(1000000 * dd) / 1000000)
        return String(roundDD)
    }
    
    func convertToDDM() -> (d: String, m: String) {
        let newMin : Double = Double((m) + (s/60))
        let roundMin : Double = Double(round(10000 * newMin) / 10000)
        let ddm : String = "\(Int(d)) \(roundMin)"
        let deg = Int(d)
        return (String(deg), String(roundMin))
    }
}
