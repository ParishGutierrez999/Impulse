//
//  ContentView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/9/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                //signed in
            TabView {
                
                
                
                PlannerView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Planner", systemImage: "list.clipboard")
                    }
                
                MacroTrackerView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Macro Tracker", systemImage: "fork.knife.circle")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
                
                BodyView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Body Stats View", systemImage: "person.fill")
                    }
                
                WorkoutView()
                    .tabItem {
                        Label("Workout Info", systemImage: "dumbbell")
                    }
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
