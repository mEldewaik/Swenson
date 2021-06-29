//
//  CurrencyViewModel.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class CurrencyViewModel {
    

    private let currenciesSubject = BehaviorRelay<[String: Double]>(value: [:])
    

    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    
    var baseBehavior = BehaviorRelay<String>(value: "")
    
    
    var currenciesObservable: BehaviorRelay<[String: Double]>{
        return currenciesSubject
    }
    
    
    func getAllCountries() {
        
        loadingBehavior.accept(true)

        let request = APIRouter.getAllCounntries
        
        AF.request(request).responseJSON { (response) in
            self.loadingBehavior.accept(false)
            
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    
                    let model = try JSONDecoder().decode(CurrencyModel.self, from: jsonData)
                                        
                    if let allCurrencies = model.rates {
                        self.currenciesSubject.accept(allCurrencies)
                        self.baseBehavior.accept(model.base ?? "")
                    }
                    
                    
                }catch let error {
                    print(error)
                }
            }
        }
    }
    
}

