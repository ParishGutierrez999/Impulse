//
//  PlannerListItemViewViewModel.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/13/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class PlannerListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: PlannerItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("plans")
            .document(itemCopy.id)
            .setData(itemCopy.asDicionary())
    }
}
