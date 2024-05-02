//
//  MacroItemView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/29/24.
//

import SwiftUI

struct MacroItemView: View {
    let item: Macros
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Image("carbs")
                        .resizable()
                        .scaledToFit()
                        .frame(width:60)
                    
                    Text("Carbs")
                    Text(item.carbs)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                
                Spacer()
                
                VStack {
                    Image("fats")
                        .resizable()
                        .scaledToFit()
                        .frame(width:60)
                    
                    Text("Fats")
                    Text(item.fats)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                
                Spacer()
                
                VStack {
                    Image("protein")
                        .resizable()
                        .scaledToFit()
                        .frame(width:60)
                    
                    Text("Protein")
                    Text(item.protein)
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
    MacroItemView(item: .init(id: "123",
                              carbs: "123",
                              fats: "321",
                              protein: "123",
                              date: Date().timeIntervalSince1970))
}
