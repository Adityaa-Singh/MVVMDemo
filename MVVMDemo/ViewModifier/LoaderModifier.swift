//
//  LoaderModifier.swift
//  MVVMDemo
//
//  Created by Kamal Saini on 04/05/26.
//

import SwiftUI


struct LoaderModifier: ViewModifier {
    
    var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                
                ProgressView("")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}


extension View {
    
    func showLoader(_ isLoading: Bool) -> some View {
        print("isLoading is \(isLoading)")
        return modifier(LoaderModifier(isLoading: isLoading))
    }
}
