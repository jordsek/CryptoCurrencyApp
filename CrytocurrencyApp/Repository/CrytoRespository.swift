//
//  CrytoRespository.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 01/11/2023.
//

import Foundation
protocol CrytoRespository {
    func getCrypto(url: URL) async throws -> [Coin]
}
