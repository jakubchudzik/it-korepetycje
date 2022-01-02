//
//  String.swift
//  it-korepetycje
//
//  Created by Jakub Chudzik on 02/01/2022.
//

import Foundation

extension String {
     func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@+[.A-Za-z0-9-]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func containsNumber() -> Bool {
        return self.rangeOfCharacter(from: .decimalDigits) != nil
    }
}
