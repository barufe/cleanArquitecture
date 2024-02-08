//
//  CryptocurrencyBasicDTO.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 7/02/24.
//

import Foundation

struct CryptocurrencyBasicDTO: Codable {
    let id: String
    let symbol: String
    let name: String
    
    enum CodingKeysL: String, CodingKey {
        case id, symbol, name
    }
}
