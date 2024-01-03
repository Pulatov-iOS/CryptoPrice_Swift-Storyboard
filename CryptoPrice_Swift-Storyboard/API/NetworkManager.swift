//
//  NetworkManager.swift
//  CryptoPrice_Swift-Storyboard
//
//  Created by Alexander on 3.01.24.
//

import Alamofire

final class NetworkManager {
    static let instance = NetworkManager()
    
    private init() { }
    
    enum Constants {
        static let coinBaseURL = "https://rest.coinapi.io/v1"
    }
    
    enum EndPoints {
        static let assets = "/assets"
    }
    
    let header: HTTPHeaders = [
        "X-CoinAPI-Key": "",
        "Accept": "application/json"
    ]
    
    func getCryptoPrice() {
        AF.request(Constants.coinBaseURL + EndPoints.assets, headers: header).responseDecodable(of: [Cryptocurrency].self) { response in
            switch response.result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
