//
//  ContentView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 01/11/2023.
//

import SwiftUI

struct CryptoView: View {
    //MARK: - Properties
    @StateObject var viewModel: CryptoViewModel
    @State private var isLoading = false
    @State private var page = 1
    @State private var searchText: String = ""
    
    var body: some View {
       NavigationStack{
            VStack{
                List{
                    ForEach(filteredCoin){ coin in
                        NavigationLink{
                            CoinDetailView(coin: coin)
                                //.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                        }label: {
                            CoinRowView(coin: coin)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .task{
                await viewModel.getCryptoList(urlString: APIEndpoints.CryptoAPIEndpoint)
            }
            .navigationTitle("Live Prices")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    } label: {
                        HeaderButtonView(iconName: "plus.magnifyingglass")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                Button{
                    
                } label: {
                    HeaderButtonView(iconName: "plus")
                }
              }
        }
    }
        .refreshable {
            await viewModel.getCryptoList(urlString: APIEndpoints.CryptoAPIEndpoint)
        }
    }
    
   
    
}

#Preview {
    CryptoView(viewModel: CryptoViewModel(repository: CrytoRepositoryImplementation(networkManager: NetworkManager())))
}

extension CryptoView {
    
   var filteredCoin: [Coin] {
                if searchText == "" { return viewModel.cryptoArray}
                return viewModel.cryptoArray.filter {
                    $0.name.lowercased().contains(searchText.lowercased())
            }
       }
}
    


