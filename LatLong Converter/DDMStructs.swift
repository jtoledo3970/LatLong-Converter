//
//  DDMStructs.swift
//  LatLong Converter
//
//  Created by Jose Toledo on 7/28/18.
//  Copyright © 2018 Toledo's IT Solutions, Inc. All rights reserved.
//

import Foundation

struct DDM {
    var d : Double
    var m : Double
    
    init(d: Double, m: Double) {
        self.d = d
        self.m = m
    }
    
    func convertToDD() -> String {
        let mTemp = Int(m)
        var sTemp = 0.0
        var s = 0.0
        if m < 1 {
            sTemp = m
        } else {
            sTemp = m - Double(mTemp)
        }
        s = sTemp * 60
        let dd = d + (Double(mTemp)/60) + (s/3600)
        let roundDD = Double(round(1000000 * dd) / 1000000)
        return String(roundDD)
    }
    
    func convertToDMS() -> (d: String, m: String, s: String) {
        let mTemp = Int(m)
        var sTemp = 0.0
        var s = 0.0
        if m < 1 {
            sTemp = m
        } else {
            sTemp = m - Double(mTemp)
        }
        s = Double(round(1000000 * (sTemp * 60) / 1000000))
        return (String(d), String(mTemp), String(s))
    }
}
