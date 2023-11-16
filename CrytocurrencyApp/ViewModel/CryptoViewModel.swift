//
//  CryptoViewModel.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 01/11/2023.
//

import Foundation

@MainActor
class CryptoViewModel: ObservableObject{
    
    //@Published var coin : Coin?
    @Published var cryptoArray: [Coin] = []
    @Published var customError: NetworkError?
    @Published var currentCoin: Coin?
    
    let repository: CrytoRespository
    init(repository: CrytoRespository){
        self.repository = repository
    }
    
    func getCryptoList(urlString: String) async{
        guard let url = URL(string:urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let result = try await repository.getCrypto(url: url)
            //DispatchQueue.main.async { [self] in
            self.cryptoArray = result.self
               // print(cryptoArray)
            //}
            
        }catch let someError {
            print(someError.localizedDescription)
            if someError as? NetworkError == .dataNotFound{
                self.customError = NetworkError.dataNotFound
            }else{
                self.customError = NetworkError.parsingError
            }
        }
        
    }
    
}
