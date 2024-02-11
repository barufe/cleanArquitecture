//
//  GlobalCryptoListView.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 8/02/24.
//

import SwiftUI

struct GlobalCryptoListView: View {
    private let viewModel: GlobalCryptoListViewModel
    
    var body: some View {
        VStack{
            List {
                ForEach(viewModel.cryptos, id: \.id) { crypto in
                    Text(crypto.name)
                }
            }.onAppear {
                viewModel.onAppear()
            }
            
        }
    }
}
