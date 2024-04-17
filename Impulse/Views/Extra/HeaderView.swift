//
//  HeaderView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/11/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.black)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.black)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "Subtitle", angle: 15, background: .brandPrimary)
}
