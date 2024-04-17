//
//  PlannerItemView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/13/24.
//

import SwiftUI

struct PlannerItemView: View {
    
    @StateObject var viewModel = PlannerItemViewViewModel()
    @Binding var newPlannerItem: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //due by
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                ButtonView(title: "Save", 
                           background: .red) {
                    if viewModel.canSave {
                        viewModel.save()
                        newPlannerItem = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill out all of the fields and select due date today or newer"))
            }
        }
    }
}

#Preview {
    PlannerItemView(newPlannerItem: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
