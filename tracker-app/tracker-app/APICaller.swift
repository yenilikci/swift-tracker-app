//
//  APICaller.swift
//  tracker-app
//
//  Created by Melih Çelik on 29.05.2022.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "DB0A317A-8039-49EF-A596-CB2F6BD60A43"
        static let assetsEndPoint = "https://rest.coinapi.io/v1/assets"
    }
    
    private init() {}
    
    // MARK: - Public
    
    public func getAllCryptoData (
        completion: @escaping (Result<[Crypto], Error>) -> Void
    )
    {
        guard let url = URL(string: Constants.assetsEndPoint + "?apikey=" + Constants.apiKey) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
             // decode response
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                
                completion(.success(cryptos))
        }
            catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
}
