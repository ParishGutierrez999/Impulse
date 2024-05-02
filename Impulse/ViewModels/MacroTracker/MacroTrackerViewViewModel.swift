//
//  MacroTrackerViewViewModel.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/19/24.
//
import FirebaseFirestore
import Foundation

class MacroTrackerViewViewModel: ObservableObject {
    @Published var showingNewMacroView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("macros")
            .document(id)
            .delete()
    }
}
