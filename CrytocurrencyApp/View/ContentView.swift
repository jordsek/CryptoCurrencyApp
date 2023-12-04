//
//  ContentView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 01/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
//        CryptoView(viewModel: CryptoViewModel(repository: CrytoRepositoryImplementation(networkManager: NetworkManager())))
        if viewModel.isLoggedOut {
            LoginView(loginViewModel: viewModel)
        }else {
            TabView{
                PostView()
                    .tabItem{
                        Image(systemName: "rectangle.potrait.on.rectangle.portrait.angled")
                        Text("")
                    }
                ProfileView(loginViewModel: viewModel)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Profile")
                    }
            }
        }
    }
}

#Preview {
        ContentView()
    }

