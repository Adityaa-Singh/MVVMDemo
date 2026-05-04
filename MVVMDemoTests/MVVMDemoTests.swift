//
//  MVVMDemoTests.swift
//  MVVMDemoTests
//
//  Created by Kamal Saini on 04/05/26.
//

import Testing
@testable import MVVMDemo

struct MVVMDemoTests {

    
    @Test
    func checkEmptyEmaild() {
        let viewModel = LoginViewModel()

        viewModel.email = ""
        viewModel.password = "password"
        
        let result = viewModel.validateLogin()
        
        
        #expect(result == false)
        #expect(viewModel.errorMessage == "Please enter email")
    }

    @Test func checkValidLoginInput() {
        
        let viewModel = LoginViewModel()
        
        viewModel.email = "test@gmail.com"
        viewModel.password = "123456"
        
        let result = viewModel.validateLogin()
        
        #expect(result == false)
    }
}
