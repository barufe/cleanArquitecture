//
//  GlobalCryptoListViewModel.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 8/02/24.
//

import Foundation
struct CryptoPresentableItem {
    let id: String
    let name: String
    let symbol: String
    let price: String
    let price24h: String
    let volume24: String
    let marketCap: String
    
    init(domainModel: Cryptocurrency){
        self.id = domainModel.id
        self.name = domainModel.name
        self.symbol = domainModel.symbol
        self.price = "\(domainModel.price) $"
        self.price24h = domainModel.volume24 != nil ? "\(domainModel.price24h!) $" : "-"
        self.volume24 = domainModel.volume24 != nil ? "\(domainModel.volume24!) $" : "-"
        self.marketCap = "\(domainModel.marketCap) $"
    }
}


class GlobalCryptoListViewModel {
    private let getGlobalCryptoList: GetGlobalCryptoListType
    @Published var cryptos : [CryptoPresentableItem] = []
    
    init(getGlobalCryptoList: GetGlobalCryptoListType){
        self.getGlobalCryptoList = getGlobalCryptoList
    }
    func onAppear(){
        Task {
            let result = await getGlobalCryptoList.execute()
            let cryptos = try? result.get().map {CryptoPresentableItem(domainModel: $0)}
                Task { @MainActor in
                    guard let cryptos = cryptos else {
                        return
                    }
                    self.cryptos = cryptos
            }
        }
    }
}
