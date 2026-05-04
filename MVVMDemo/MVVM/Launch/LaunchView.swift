//
//  LaunchView.swift
//  MVVMDemo
//
//  Created by Kamal Saini on 04/05/26.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            Group {
                if appState.isUserlogin {
                    ContentView()
                } else {
                    LoginView()
                }
            }
        }
    }
}

#Preview {
    LaunchView()
}
