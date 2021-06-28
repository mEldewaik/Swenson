//
//  Anagrams.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import Foundation

class AnagramsCheck {
    
    /// This function returns an Anagrams Boolen value for a given `str1`, `str2`
    ///
    /// ```
    /// checkForAnagram("debit card","bad credit") // true
    /// ```
    /// - Parameter str1: First String.
    /// - Parameter str2: Second String.
    /// - Returns: Anagrams Boolean to the `str1` & `str2`.
    
    
    func checkForAnagram(_ str1: String,_ str2: String) -> Bool {
        
        let firstString = str1.trimmingCharacters(in: .whitespaces).lowercased().sorted()
        let secondString = str2.trimmingCharacters(in: .whitespaces).lowercased().sorted()
    
        return firstString == secondString
    }
}
