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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInformation(cryptocurrency: Cryptocurrency) {
        cryptoNameLabel.text = cryptocurrency.name
    }
    
}
