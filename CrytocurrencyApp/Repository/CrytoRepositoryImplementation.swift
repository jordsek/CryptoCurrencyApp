//
//  CrytoRepositoryImplementation.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 01/11/2023.
//

import Foundation

final class CrytoRepositoryImplementation: CrytoRespository {
    
    var networkManager: Fetchable
    init(networkManager: Fetchable) {
            self.networkManager = networkManager
        }
    func getCrypto(url: URL) async throws -> [Coin]{
        do {
            let data = try await networkManager.getDataFromAPI(url: url)
            let result = try JSONDecoder().decode([Coin].self, from: data)
            return result
        }catch {
            throw error
        }
    }
}

