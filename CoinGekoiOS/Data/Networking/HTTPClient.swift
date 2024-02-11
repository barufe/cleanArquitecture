//
//  HTTPClient.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 8/02/24.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HTTPClientError>
}
