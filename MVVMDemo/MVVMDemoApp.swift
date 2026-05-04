//
//  MVVMDemoApp.swift
//  MVVMDemo
//
//  Created by Kamal Saini on 04/05/26.
//

import SwiftUI

@main
struct MVVMDemoApp: App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LaunchView()
                    .environmentObject(appState)
            }
        }
    }
    
}
