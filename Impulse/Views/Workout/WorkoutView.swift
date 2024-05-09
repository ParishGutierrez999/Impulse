//
//  WorkoutView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 5/9/24.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("arnold")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                
                Link("Learn More",
                     destination: .init(string:"https://www.youtube.com/watch?v=d67ldITFMng&list=WL&index=1")!)
                .font(.title)
                .foregroundColor(Color.brandPrimary)
                
                
                
                Image("ppl")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                
                Link("Learn More",
                     destination: .init(string:"https://www.youtube.com/watch?v=d67ldITFMng&list=WL&index=1")!)
                .font(.title)
                .foregroundColor(Color.brandPrimary)
                
                
                Image("bro")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                
                Link("Learn More",
                     destination: .init(string:"https://www.youtube.com/watch?v=d67ldITFMng&list=WL&index=1")!)
                .font(.title)
                .foregroundColor(Color.brandPrimary)
                
            }
        }
    }
}

#Preview {
    WorkoutView()
}
