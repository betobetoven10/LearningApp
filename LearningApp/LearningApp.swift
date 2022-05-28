//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Alberto Madueño Navarrete on 5/28/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
