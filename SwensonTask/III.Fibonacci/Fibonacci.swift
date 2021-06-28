//
//  Fibonacci.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import Foundation

class FibonacciFinder {
    
    /// This function for iterative approach  for a given `n`.
    /// ```
    /// Time Complexity: O(n)
    ///
    /// Space Complexity: O(1)
    ///
    /// fibIterative(5) // 8
    /// ```
    /// - Parameter n: number to be calculated.
    /// - Returns: the nth Fibonacci number `number`.
    
    func fibIterative(_ n: Int) -> Int {

        var a = 1
        var b = 1
        guard n > 1 else { return a }
        
        (2...n).forEach { _ in
            (a, b) = (a + b, a)
        }
        return a
    }
    
    /// This function for Recursive approach  for a given `n`.
    /// ```
    /// Time Complexity: O(2^n)
    ///
    /// Space Complexity: O(2^n)
    ///
    /// fibRecursive(5) // 8
    /// ```
    /// - Parameter n: number to be calculated.
    /// - Returns: the nth Fibonacci number `number`.
    
    func fibRecursive(_ number: Int) -> Int {
        guard number > 1 else { return number }
        return fibRecursive(number-1) + fibRecursive(number-2)
    }

}


