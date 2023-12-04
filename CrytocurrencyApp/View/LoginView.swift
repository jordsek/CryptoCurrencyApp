//
//  LoginView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 29/11/2023.
//

import SwiftUI

struct LoginView: View {
    //MARK: -properties
    @ObservedObject var loginViewModel: LoginViewModel
    
    @State private var isLoginMode = false
    @State private var email = ""
    @State private var password = ""
    @State private var image: UIImage?
    @State private var loginStatusMessage = ""
    @State private var shouldShoeImagePicker = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16){
                Text(isLoginMode ? "Login" : "Create Account")
                    .font(.largeTitle)
                    .bold()
                
                //Image
                if !isLoginMode{
                    Button{
                        shouldShoeImagePicker.toggle()
                    } label: {
                        VStack{
                            if let image = image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 128, height: 128)
                                    .cornerRadius(64)
                            }else {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 64))
                                    .padding()
                                    .foregroundColor(.black)
                            }
                        }
                        .overlay(
                        RoundedRectangle(cornerRadius: 64)
                            .stroke(Color.black, lineWidth: 3))
                    }
                }
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .bold()
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .bold()
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                Button{
                    handleAction()
                } label: {
                    Text(isLoginMode ? "Login" : "Create Account")
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(width: 300, height: 50)
                        .background(.gray)
                        .cornerRadius(10)
                        .padding(.top, 20)
                        .shadow(color: Color(.black), radius: 3, x: 0, y: 9)
                        
                }
                
                HStack{
                    Text(isLoginMode ? "Don't have account" : "Have an account?")
                    
                    Button{
                        isLoginMode.toggle()
                    } label: {
                        Text(isLoginMode ? "Create Account" : "Login")
                    }
                }
                Text(loginStatusMessage)
                    .foregroundStyle(.red)
            }
            .fullScreenCover(isPresented: $shouldShoeImagePicker) {
                ImagePicker(image: $image)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    LoginView(loginViewModel: LoginViewModel())
}

extension LoginView {
    private func handleAction(){
        if isLoginMode {
            loginViewModel.loginUser(email: email, password: password)
        }else {
            if let image = image {
                loginViewModel.createNewAccount(email: email, password: password, image: image)
            } else {
                self.loginStatusMessage = "Select an image first!"
            }
        }
    }
}


