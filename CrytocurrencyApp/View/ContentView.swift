//
//  ContentView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 01/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CryptoView(viewModel: CryptoViewModel(repository: CrytoRepositoryImplementation(networkManager: NetworkManager())))
    }
}

#Preview {
        ContentView()
    }

