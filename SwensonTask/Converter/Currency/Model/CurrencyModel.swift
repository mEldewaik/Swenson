//
//  CurrencyModel.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 29/06/2021.
//

import Foundation

// MARK: - CurrencyModel
struct CurrencyModel: Codable {
    let success: Bool?
    let timestamp: Int?
    let base, date: String?
    let rates: [String: Double]?
}
