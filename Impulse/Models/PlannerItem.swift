//
//  Planner.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/13/24.
//

import Foundation

struct PlannerItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
