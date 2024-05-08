//
//  NewBodyView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 5/8/24.
//

import SwiftUI

struct NewBodyView: View {
    
    @StateObject var viewModel = NewBodyViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("Update Body Statistics")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Height", text: $viewModel.height)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Weight", text: $viewModel.weight)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Today's Date", selection: $viewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
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
    NewBodyView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
