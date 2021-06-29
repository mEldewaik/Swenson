//
//  CurrencyConverterVC.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 30/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class CurrencyConverterVC: UIViewController {
    
    @IBOutlet weak var flag_base: UILabel!
    @IBOutlet weak var txt_base: UITextField!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var flag_converted: UILabel!
    @IBOutlet weak var txt_converted: UITextField!
    @IBOutlet weak var lbl_country_converted: UILabel!
    @IBOutlet weak var btn_back: UIBarButtonItem!
    
    private (set) public var disposeBag = DisposeBag()
    
    var baseBehavior = BehaviorRelay<String>(value: "")
    var convertedBehavior = BehaviorRelay<(String,Double)?>(value: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subscribeToBackBtn()
        self.subscribeToValues()
        self.subscribeToTextFieldBase()
    }
    
    private
    func subscribeToTextFieldBase() {
        txt_base.rx.controlEvent([.editingChanged])
            .asObservable().subscribe({ [unowned self] _ in
                guard let base = txt_base.text, !(base.isEmpty) else {
                    self.txt_converted.text = "\(self.calculateNewValue(base: "1"))"
                    return
                }
                self.txt_converted.text = "\(self.calculateNewValue(base: base))"
            }).disposed(by: disposeBag)
    }
    
    private
    func calculateNewValue(base: String) -> Double {
        guard let convertedValue = self.convertedBehavior.value else {return 0.0}
        let newCalc = (Double(base) ?? 1.0) * (convertedValue.1)
        return newCalc
    }
    
    private
    func subscribeToBackBtn() {
        btn_back.rx
            .tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else {return}
                self.navigationController?.popViewController(animated: true)
            }).disposed(by: disposeBag)
    }
    
    private
    func subscribeToValues() {
        Observable
            .zip(baseBehavior, convertedBehavior)
            .bind { [unowned self] base, converted in
                self.lbl_country.text = base
                self.flag_base.text = HelperMethods.emoji(countryCode: base)
                
                
                guard let converted = converted else {return}
                
                self.txt_converted.text = "\(converted.1)"
                self.flag_converted.text = HelperMethods.emoji(countryCode: converted.0)
                self.lbl_country_converted.text = "\(converted.0)"
            }
            .disposed(by: disposeBag)
    }
    
}

extension CurrencyConverterVC {
    static func instantiate() -> CurrencyConverterVC {
        let sb = UIStoryboard(name: "Converter", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CurrencyConverterVC") as! CurrencyConverterVC
        return vc
    }
}
