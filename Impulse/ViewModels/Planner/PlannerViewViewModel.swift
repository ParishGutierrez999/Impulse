//
//  PlannerViewViewModel.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/13/24.
//
import FirebaseFirestore
import Foundation

class PlannerViewViewModel: ObservableObject {
    
    @Published var showingPlannerItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("plans")
            .document(id)
            .delete()
    }
}
