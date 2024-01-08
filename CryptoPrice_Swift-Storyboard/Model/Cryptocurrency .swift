//
//  СryptoСurrency.swift
//  CryptoPrice_Swift-Storyboard
//
//  Created by Alexander on 3.01.24.
//

import Foundation

struct Cryptocurrency: Codable {
    let assetId: String?
    let name: String
    let typeIsCrypto: Int?
    let dataQuoteStart: String?
    let dataQuoteEnd: String?
    let dataOrderbookStart: String?
    let dataOrderbookEnd: String?
    let dataTradeStart: String?
    let dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1hrsUsd: Double?
    let volume1dayUsd: Double?
    let volume1mthUsd: Double?
    let price_usd: Double?
    let dataStart: String?
    let dataEnd: String?
}
