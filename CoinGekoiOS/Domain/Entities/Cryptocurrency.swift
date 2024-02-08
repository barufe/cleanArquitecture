//
//  Cryptocurrency.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 31/01/24.
//

import Foundation

struct Cryptocurrency {
    let id: String
    let name: String
    let symbol: String
    let price: Double
    let price24h: Double?
    let volume24: Double?
    let marketCap: Double
}
