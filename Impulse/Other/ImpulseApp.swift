//
//  ImpulseApp.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/9/24.
//

import FirebaseCore
import SwiftUI

@main
struct ImpulseApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
