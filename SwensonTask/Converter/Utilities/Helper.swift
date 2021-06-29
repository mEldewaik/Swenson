//
//  Helper.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 29/06/2021.
//

import Foundation


class HelperMethods: NSObject {
    
    class func emoji(countryCode: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in countryCode.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        
        return String(s)
    }
    
}
