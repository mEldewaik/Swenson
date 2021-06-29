//
//  CurrencyTableViewCell.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_flag: UILabel!
    @IBOutlet weak var lbl_flag_string: UILabel!
    @IBOutlet weak var lbl_value: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(countryCode: String, valueRate: Double?) {
        self.lbl_flag.text = HelperMethods.emoji(countryCode: countryCode)
        self.lbl_flag_string.text = countryCode
        self.lbl_value.text = "\((valueRate ?? 0.0).rounded(toPlaces: 3))"
    }
    
}
