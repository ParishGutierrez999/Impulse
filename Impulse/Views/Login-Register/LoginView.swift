//
//  LogInView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Impulse", 
                           subTitle: "Find a way, not excuse",
                           angle: -15,
                           background: .brandPrimary)
                
                //Login Form
                                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }

                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none
                        )
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    ButtonView(title: "Log In", 
                               background: .blue) {
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .offset(y: -100)
                
                
                //Create Account
                VStack {
                    Text("New User?")
                    
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
