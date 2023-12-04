//
//  ProfileView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 30/11/2023.
//

import SwiftUI

struct ProfileView: View {
    //MARK: -properties
    @StateObject var loginViewModel: LoginViewModel
    
    @State private var showLogOutOptions = false
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        showLogOutOptions.toggle()
                    } label: {
                        Image(systemName: "gear")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundColor(.black)
                    }
                }
            }
            .actionSheet(isPresented: $showLogOutOptions){
                ActionSheet(title: Text("Settings"),
                message: Text("Whazt do you want to do ?"),
                buttons: [
                    .destructive(Text("Sign Out"), action: {
                        loginViewModel.handleSignOut()
                    }), .cancel()
                ])
            }
        }
    }
}

#Preview {
    ProfileView(loginViewModel: LoginViewModel())
}
