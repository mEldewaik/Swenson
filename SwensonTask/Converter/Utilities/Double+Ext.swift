//
//  Double+Ext.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 29/06/2021.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
      let formatter = DateComponentsFormatter()
      formatter.allowedUnits = [.hour, .minute]
      formatter.unitsStyle = style
      guard let formattedString = formatter.string(from: self) else { return "" }
      return formattedString
    }
}
