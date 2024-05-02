//
//  NewMacroViewViewModel.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/20/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewMacroViewViewModel: ObservableObject {
    
    @Published var carbs = ""
    @Published var fats = ""
    @Published var protein = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // create model
        let newId = UUID().uuidString
        let newItem = Macros(
            id: newId,
            carbs: carbs,
            fats: fats,
            protein: protein,
            date: Date().timeIntervalSince1970
        )
        
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("macros")
            .document(newId)
            .setData(newItem.asDicionary())
    }
    var canSave: Bool {
        guard !carbs.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !fats.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !protein.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
