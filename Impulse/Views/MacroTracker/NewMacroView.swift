//
//  NewMacroView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/20/24.
//

import SwiftUI

struct NewMacroView: View {
    
    @StateObject var viewModel = NewMacroViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("Macros for the Day")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //Carbs
                TextField("Carbs", text: $viewModel.carbs)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Fats
                TextField("Fats", text: $viewModel.fats)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Protein
                TextField("Protein", text: $viewModel.protein)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Date
                DatePicker("Today's Date", selection: $viewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                ButtonView(title: "Save",
                           background: .red) {
                    //Action
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select a date that is valid. "))
            }
        }
    }
}

#Preview {
    NewMacroView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
