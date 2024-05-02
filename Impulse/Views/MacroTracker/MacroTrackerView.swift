//
//  MacroTrackerView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/19/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct MacroTrackerView: View {
    
    @StateObject var viewModel: MacroTrackerViewViewModel
    @FirestoreQuery var items: [Macros]
    
    init(userId: String) {
        // users/<id>/macros/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/macros")
        self._viewModel = StateObject(wrappedValue: MacroTrackerViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    MacroItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                
            }
            .navigationTitle("Macro Tracker")
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewMacroView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewMacroView) {
                NewMacroView(newItemPresented: $viewModel.showingNewMacroView)
            }
        }
    }
}

#Preview {
    MacroTrackerView(userId: "9OTSatUBceTgIx562MftWtRKGYk2")
}
