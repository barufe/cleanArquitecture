//
//  CrytoCurrencyRepository.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 31/01/24.
//

import Foundation

class CrytocurrencyRepository : GlobalCryptoListRepsitoryType {
    private let apiDatasource: ApiDataSourceType
    private let errorMapper: CryptocurrencyDomainErrorMapper
    private let domainMapper: CryptocurrencyDomainMapper
    
    init(apiDatasource: ApiDataSourceType, errorMapper: CryptocurrencyDomainErrorMapper, domainMapper: CryptocurrencyDomainMapper){
        self.apiDatasource = apiDatasource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    
    func getGlobalCryptoList() async -> Result<[Cryptocurrency], CryptocurrencyDomainError> {
        
        let symbolListResult = await apiDatasource.getGlobalCryptoSymbolList()
        let cryptoListResult = await apiDatasource.getCryptoList()
        
        
        
        guard case .success(let symbolList) = symbolListResult else {
            return .failure(errorMapper.map(error: symbolListResult.failureValue as? HTTPClientError))
        }
        
        guard case .success(let cryptoList) = cryptoListResult else {
            return .failure(errorMapper.map(error: cryptoListResult.failureValue as? HTTPClientError))
        }
        
        let cryptocurrencyBuilderList = domainMapper.getCryptoCurrencyBuilderList(symbolList: symbolList, cryptoList: cryptoList)
        
        let priceInfoResult = await apiDatasource.getPriceInfoForCryptos(id: cryptocurrencyBuilderList.map{ $0.id })
        
        guard case .success(let priceInfo) = priceInfoResult else {
            return .failure(errorMapper.map(error: priceInfoResult.failureValue as? HTTPClientError))
        }
        
        let cryptocurrency = domainMapper.map(cryptocurrencyBuilderList: cryptocurrencyBuilderList, priceInfo: priceInfo)
        
        
        return .success(cryptocurrency)
    }
}
