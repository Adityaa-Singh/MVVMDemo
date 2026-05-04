//
//  AppState.swift
//  MVVMDemo
//
//  Created by Kamal Saini on 04/05/26.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    
    @AppStorage("isUserlogin") var isUserlogin: Bool = false
    
    func login() {
        isUserlogin = true
    }

    func logout() {
        isUserlogin = false
    }
}

