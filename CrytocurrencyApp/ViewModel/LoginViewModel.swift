//
//  LoginViewModel.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 29/11/2023.
//

import Foundation
import Firebase
import FirebaseStorage

class LoginViewModel: ObservableObject {
    @Published var isLoggedOut = false
    
    init(){
        isLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
    }
    
    func loginUser(email: String, password: String) {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to login user \(error)")
                return
            }
            self.isLoggedOut = false
            print("Successfully logged in as a user: \(result!.user.uid)")
        }
    }
    
    func createNewAccount(email: String, password: String, image: UIImage){
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                    print("Failed to create user \(error)")
                    return
                }
                
            print("Successfully created user \(result!.user.uid)")
            self.loginUser(email: email, password: password)
            }
    }
}
