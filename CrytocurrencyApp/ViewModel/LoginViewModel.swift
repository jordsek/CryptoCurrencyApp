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
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { [self] result, error in
            if let error = error {
                    print("Failed to create user \(error)")
                    return
                }
                
            print("Successfully created user \(result!.user.uid)")
            self.loginUser(email: email, password: password)
            persistImageToStorage(email: email, image: image)
            }
    }
    
    func persistImageToStorage(email: String, image: UIImage){
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = image.jpegData(compressionQuality: 5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print(error)
                return
            }
            
            ref.downloadURL { url , error in
                if let error = error {
                    print(error)
                    return
                }
                
                print(url?.absoluteString ?? "error")
                guard let url = url else { return }
                self.storeUserInformation(email: email, imageProfileURL: url)
            }
        }
    }
    
    func storeUserInformation(email: String, imageProfileURL: URL){
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["email": email, "uid": uid, "profileimageurl": imageProfileURL.absoluteString]
        
        FirebaseManager.shared.firestore
            .collection("users")
            .document(uid)
            .setData(userData)
    }
    
    func handleSignOut(){
        isLoggedOut = true
        try? FirebaseManager.shared.auth.signOut()
    }
}
