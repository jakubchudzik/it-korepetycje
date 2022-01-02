//
//  LoginViewModel.swift
//  it-korepetycje
//
//  Created by Jakub Chudzik on 02/01/2022.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isPresented = false
    @Published var isPresentedRegistration = false
    
    @Published var isEnabledErrorTextView = false
    @Published var descriptionError = ""
    
    
    func login() {
        guard email.isValidEmail() else {
            descriptionError = "zły forrmat emaila"
            isEnabledErrorTextView = true
            return
        }
        
        guard password.count >= 8 else {
            descriptionError = "za krótkie hasło"
            isEnabledErrorTextView = true
            return
        }
        
        MyFirebaseService.shared.signIn(email: email, password: password) { error in
            if let error = error {
                //niepoprawne
                self.descriptionError = error.localizedDescription
                self.isEnabledErrorTextView = true
            } else {
                // Udane zalogowanie
                self.isPresented = true
            }
        }
    }
    
    func gotoRegistration() {
        isPresentedRegistration = true
    }
    
}
