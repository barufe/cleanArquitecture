//
//  CryptoCurrencyGlobalInfoDTO.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 8/02/24.
//

import Foundation

struct CryptoCurrencyGlobalInfoDTO: Codable {
    let data: CryptoCurrencyGlobalData
    
    struct CryptoCurrencyGlobalData: Codable {
        let cryptocurrency: [String: Double]
        
        enum CodingKeys: String, CodingKey {
            case cryptocurrency = "market_cap_percentage"
        }
    }
}
