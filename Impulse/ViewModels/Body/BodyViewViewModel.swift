//
//  BodyViewViewModel.swift
//  Impulse
//
//  Created by Parish Gutierrez on 5/8/24.
//
import FirebaseFirestore
import Foundation

class BodyViewViewModel: ObservableObject {
    @Published var showingNewBodyView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id:String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("body-stats")
            .document(id)
            .delete()
    }
}
