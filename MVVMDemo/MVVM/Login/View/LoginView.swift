//
//  LoginView.swift
//  MVVMDemo
//
//  Created by Kamal Saini on 04/05/26.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var appState: AppState

    var body: some View {
        
        HStack(alignment: .center, spacing: 10) {
            VStack(spacing: 20){
                
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)

                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Login") {
                    viewModel.login(appState: appState)
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: 400)
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
        
        // Attach alert to the view
        .alert("Login Failed", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
        
        .showLoader(viewModel.isLoading)
    }
    
}

#Preview {
    LoginView()
}
