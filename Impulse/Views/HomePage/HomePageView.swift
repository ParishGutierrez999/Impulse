//
//  HomePageView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/11/24.
//

import SwiftUI

struct HomePageView: View {
    
    
    @StateObject var viewModel = HomePageViewViewModel()
    
    
    init() {}
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Home Page")
        }
    }
}
#Preview {
    HomePageView()
}
