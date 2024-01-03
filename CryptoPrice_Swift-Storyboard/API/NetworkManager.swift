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
        "X-CoinAPI-Key": "", Key
        "Accept": "application/json"
    ]
    
    func getCryptoPrice(completion: @escaping(Result<[Cryptocurrency], Error>) -> Void) {
        AF.request(Constants.coinBaseURL + EndPoints.assets, headers: header).responseDecodable(of: [Cryptocurrency].self) { response in
            switch response.result {
            case .success(let cryptocurrencies):
                completion(.success(cryptocurrencies))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
