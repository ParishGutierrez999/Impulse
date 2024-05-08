//
//  NewBodyViewViewModel.swift
//  Impulse
//
//  Created by Parish Gutierrez on 5/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewBodyViewViewModel: ObservableObject {
    
    @Published var height = ""
    @Published var weight = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        // get current user
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //create model
        let newId = UUID().uuidString
        let newItem = Body(id: newId,
                           height: height,
                           weight: weight,
                           date: Date().timeIntervalSince1970)
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("body-stats")
            .document(newId)
            .setData(newItem.asDicionary())
    }
    var canSave: Bool {
        guard !height.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !weight.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true

    }
}
