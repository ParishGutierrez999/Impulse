//
//  BodyItemView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 5/8/24.
//

import SwiftUI

struct BodyItemView: View {
    let item: Body
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Image("height")
                        .resizable()
                        .scaledToFit()
                        .frame(width:60)
                    
                    Text("Height")
                    Text(item.height)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                
                Spacer()
                
                VStack {
                    Image("weight-scale")
                        .resizable()
                        .scaledToFit()
                        .frame(width:60)
                    
                    Text("Weight")
                    Text(item.weight)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                
                Spacer()
            }
            .padding()
        }
        Text("\(Date(timeIntervalSince1970: item.date).formatted(date: .abbreviated, time: .shortened))")
    }
}

#Preview {
    BodyItemView(item: .init(id: "123",
                             height: "5'9",
                             weight: "321",
                             date: Date().timeIntervalSince1970))
}
