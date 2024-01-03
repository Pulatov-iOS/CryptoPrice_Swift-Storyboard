//
//  XibCryptoPriceTableViewCell.swift
//  CryptoPrice_Swift-Storyboard
//
//  Created by Alexander on 3.01.24.
//

import UIKit

final class XibCryptoPriceTableViewCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet private weak var cryptoNameLabel: UILabel!
    @IBOutlet private weak var cryptoPriceLabel: UILabel!
    @IBOutlet private weak var cellMainView: UIView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cellMainView.layer.cornerRadius = 8
    }

    // MARK: - Helpers
    func setInformation(cryptocurrency: Cryptocurrency) {
        cryptoNameLabel.text = cryptocurrency.name
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 3
        if let formattedNumber = formatter.string(from: NSNumber(value: cryptocurrency.price_usd ?? 0)) {
            cryptoPriceLabel.text = "$\(formattedNumber)"
        }
    }
}
