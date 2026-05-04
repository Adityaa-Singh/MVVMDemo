//
//  LoginViewModel.swift
//  MVVMDemo
//
//  Created by Kamal Saini on 04/05/26.
//

import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    
    func validateLogin() -> Bool {
        
        if email.isEmpty {
            errorMessage = "Please enter email"
            showError = true
            return false
        }
        
        if !isValidEmail(email) {
            errorMessage = "Please enter valid email"
            showError = true
            return false
        }
        
        if password.isEmpty {
            errorMessage = "Please enter password"
            showError = true
            return false
        }
        
        if password.count < 6 {
            errorMessage = "Password must be at least 6 characters"
            showError = true
            return false
        }
        
        return true
    }
    
    
    func login(appState: AppState) {
        
        guard validateLogin() else { return }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false
            
            if self.email == "test@gmail.com" &&
               self.password == "Test@123" {
                appState.login()
            } else {
                self.errorMessage = "Invalid credentials"
                self.showError = true
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
}
