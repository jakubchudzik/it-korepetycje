//
//  RegistrationViewModel.swift
//  it-korepetycje
//
//  Created by Jakub Chudzik on 02/01/2022.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var password2: String = ""
    @Published var isPresented = false
    @Published var isEnabledErrorTextView = false
    @Published var descriptionError: String = ""
    
    
    func createUser() {
        guard email.isValidEmail() else {
            descriptionError = "zły forrmat emaila"
            isEnabledErrorTextView = true
            return
        }
        
        guard password == password2 else {
            descriptionError = "hasła są nie takie same"
            isEnabledErrorTextView = true
            return
        }
        guard password.count >= 8 && password2.count >= 8 else {
            descriptionError = "hasło musi zawierać conajmniej 8 znaków"
            isEnabledErrorTextView = true
            return
        }
        
        guard password.containsNumber() else {
            descriptionError = "hasło musi zawierać conajmniej 1 liczbę"
            isEnabledErrorTextView = true
            return
        }
        
        MyFirebaseService.shared.createUser(email: email, password: password) { [weak self] in
            self?.isPresented = true
        }
    }
    
}
