//
//  ViewController.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let x = FibonacciFinder()
        print(x.fibIterative(5))
    }


}

