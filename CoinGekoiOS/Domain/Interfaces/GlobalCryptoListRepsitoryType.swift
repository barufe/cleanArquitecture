//
//  GlobalCryptoListRepsitoryType.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 31/01/24.
//

import Foundation

protocol GlobalCryptoListRepsitoryType {
    func getGlobalCryptoList() async -> Result<[Cryptocurrency], CryptocurrencyDomainError>
}
