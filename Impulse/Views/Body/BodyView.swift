//
//  BodyView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 5/8/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct BodyView: View {
    
    @StateObject var viewModel: BodyViewViewModel
    @FirestoreQuery var items: [Body]
    
    init(userId: String) {
        // users/<id>/body-stats/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/body-stats")
        self._viewModel = StateObject(wrappedValue: BodyViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    BodyItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("Body Statistics Tracker")
            .toolbar {
                Button {
                    viewModel.showingNewBodyView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewBodyView) {
                NewBodyView(newItemPresented: $viewModel.showingNewBodyView)
            }
        }
    }
}

#Preview {
    BodyView(userId: "9OTSatUBceTgIx562MftWtRKGYk2")
}
