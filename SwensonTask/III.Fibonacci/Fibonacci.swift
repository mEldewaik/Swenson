//
//  Fibonacci.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import Foundation

class FibonacciFinder {
    
    func fibIterative(_ number: Int) -> Int {

        var a = 1
        var b = 1
        guard number > 1 else { return a }
        
        (2...number).forEach { _ in
            (a, b) = (a + b, a)
        }
        return a
    }
    
    func fibRecursive(_ number: Int) -> Int {
        guard number > 1 else { return number }
        return fibRecursive(number-1) + fibRecursive(number-2)
    }

}


