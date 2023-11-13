//
//  APIEndpoints.swift
//  TodoAppWidget
//
//  Created by Jordan Isac on 19/10/2023.
//

import Foundation

struct APIEndpoints{
    
    static let pageLimit = 20
    private var page = 0
    static var CryptoAPIEndpoint = "https://api.coingecko.com/api/v3/coins/\(BaseUrl)"
    
    static var BaseUrl = "markets?vs_currency=usd&order=market_cap_desc&per_page=10&sparkline=true&price_change_percentage=24h"
    
}



//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&price_change_percentage=24h

//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&sparkline=true&price_change_percentage=24h
