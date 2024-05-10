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
                
                Text("The Arnold split, also known as the Arnold Schwarzenegger split, is a popular bodybuilding workout routine characterized by training each major muscle group twice a week. It typically involves splitting the body into different muscle groups and training each group on separate days, focusing on high volume and intensity. Named after the legendary bodybuilder and actor Arnold Schwarzenegger, this split emphasizes both strength and hypertrophy, making it a favorite among intermediate to advanced lifters aiming for muscle growth and development.")
                    .font(.body)
                    .padding()
                
                Link("Learn More",
                     destination: .init(string:"https://fitbod.me/blog/arnold-split/#:~:text=The%20Arnold%20split%20is%20a,it's%20only%20for%20advanced%20lifters.")!)
                .font(.title)
                .foregroundColor(Color.brandPrimary)
                
                
                
                Image("ppl")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                
                Text("The Push, Pull, Legs (PPL) split is a popular weightlifting routine divided into three primary training sessions: push, pull, and legs. The push day targets muscles involved in pushing movements such as chest, shoulders, and triceps. Conversely, the pull day focuses on pulling movements, engaging muscles like back, biceps, and rear deltoids, while the legs day concentrates on lower body muscles like quadriceps, hamstrings, and calves.")
                    .font(.body)
                    .padding()
                
                Link("Learn More",
                     destination: .init(string:"https://www.muscleandstrength.com/workouts/6-day-powerbuilding-split-meal-plan")!)
                .font(.title)
                .foregroundColor(Color.brandPrimary)
                
                
                Image("bro")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                
                Text("The bro split, colloquially named for its popularity among gym enthusiasts, is a workout routine that typically targets one muscle group per training session, spread out over several days in a week. It often involves training each muscle group once a week, allowing for ample time for recovery and growth. While favored by some for its simplicity and focus on individual muscle groups, it may not optimize muscle protein synthesis compared to more frequent training splits.")
                    .font(.body)
                    .padding()
                
                Link("Learn More",
                     destination: .init(string:"https://www.eatthis.com/what-is-a-bro-split-workout/#:~:text=As%20previously%20noted%2C%20the%20bro,to%20six%20days%20per%20week.")!)
                .font(.title)
                .foregroundColor(Color.brandPrimary)
                
            }
        }
    }
}

#Preview {
    WorkoutView()
}
