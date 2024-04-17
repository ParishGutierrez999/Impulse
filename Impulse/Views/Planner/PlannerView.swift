//
//  PlannerView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/13/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct PlannerView: View {
    
    @StateObject var viewModel: PlannerViewViewModel
    @FirestoreQuery var items: [PlannerItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/plans")
        self._viewModel = StateObject(wrappedValue: PlannerViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    PlannerListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Planner")
            .toolbar {
                Button {
                    //action
                    viewModel.showingPlannerItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingPlannerItemView) {
                PlannerItemView(newPlannerItem: $viewModel.showingPlannerItemView)
            }
        }
    }
}

#Preview {
    PlannerView(userId: "9OTSatUBceTgIx562MftWtRKGYk2")
}
