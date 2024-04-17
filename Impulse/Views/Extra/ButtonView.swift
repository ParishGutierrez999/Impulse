//
//  ButtonView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/11/24.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    ButtonView(title: "title",
               background: .brandPrimary) {
        //Action
    }
}
