//
//  CurrencyVC.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class CurrencyVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbl_flag: UILabel!
    @IBOutlet weak var lbl_currency: UILabel!
    
    private (set) public var viewModel = CurrencyViewModel()
    private (set) public var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.registerCells()
        self.getData()
        self.subscribeToLoading()
        self.subscribetoRates()
        self.subscribeToBase()
    }
    
    private
    func registerCells() {
        self.tableView.registerNibForTable(ofType: CurrencyTableViewCell.self)
    }
    
    private
    func getData() {
        viewModel.getAllCountries()
    }
    
    private
    func subscribeToLoading() {
        viewModel.loadingBehavior.subscribe(onNext: { [weak self] (isLoading) in
            guard let self = self else {return}
            if isLoading {
                 self.startAnimate()
            }else{
                 self.stopAnimate()
            }
        }).disposed(by: disposeBag)

    }
    
    private
    func subscribeToBase() {
        viewModel.baseBehavior.subscribe(onNext: { [weak self] (base) in
            guard let self = self else {return}
            if base != "" {
                self.lbl_currency.text = base
                self.lbl_flag.text = HelperMethods.emoji(countryCode: base)
            }
        }).disposed(by: disposeBag)

    }
    
    private
    func subscribetoRates() {
        viewModel.currenciesObservable.bind(to: tableView.rx.items){ [weak self] (tableView, row, rate) -> UITableViewCell in
            guard let self = self else {return UITableViewCell()}
            let cell = self.tableView.dequeueCellForTable(ofType: CurrencyTableViewCell.self)
            cell.configureCell(countryCode: rate.key, valueRate: rate.value)
            return cell
        }.disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected((String,Double).self)
            .subscribe(onNext: { item in
                let vc = CurrencyConverterVC.instantiate()
                vc.baseBehavior.accept(self.viewModel.baseBehavior.value)
                vc.convertedBehavior.accept(item)
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        
    }

}
