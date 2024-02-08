//
//  GetGlobalCryptoList.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 31/01/24.
//

import Foundation


class GetGlobalCryptoList {
    private let repository: GlobalCryptoListRepsitoryType
    
    init(repository: GlobalCryptoListRepsitoryType) {
        self.repository = repository
    }
    func execute() async -> Result<[Cryptocurrency], CryptocurrencyDomainError>{
        let result = await repository.getGlobalCryptoList()
        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        
        return .success(cryptoList.sorted {$0.marketCap < $1.marketCap})
    }
}
