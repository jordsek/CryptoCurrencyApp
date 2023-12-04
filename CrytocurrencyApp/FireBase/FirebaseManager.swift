//
//  FirebaseManager.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 29/11/2023.
//

import Foundation
import Firebase
import FirebaseStorage

class FirebaseManager: NSObject {
    var auth: Auth
    var storage: Storage
    var firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
       
        auth = Auth.auth()
        storage = Storage.storage()
        firestore = Firestore.firestore()
        
        super.init()
    }
}
