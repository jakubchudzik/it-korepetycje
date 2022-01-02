//
//  Tutor.swift
//  ITKorepetycje
//
//  Created by Jakub Chudzik on 13/11/2021.
//

import Foundation
import SwiftUI

struct Tutor: Identifiable, Codable {
    var id = UUID()
    var email: String
    var name: String
    var surname: String
    var description: String
    var profilImg: String
    var subjects: [Subjects]
    var score: Double
    
    enum CodingKeys: String, CodingKey {
        case email
        case name
        case surname
        case description
        case profilImg
        case subjects
        case score
    }

}

struct Subjects: Codable {
    var name: String
    var price: Int
}

extension Tutor {
    var sube: String {
        subjects.compactMap { $0.name }.joined(separator: ", ")
    }
    
    static func all() -> [Tutor] {
        return[
            Tutor(email:"maksiu123@wp.pl",name: "Maksymilian", surname: "Bąk", description: "Jestem nauczycielem od 5 lat. Matematyka i fizyka to moja pasja.", profilImg: "testowy",subjects: [Subjects(name: "Matematyka", price: 90),Subjects(name: "Fizyka", price: 110)],score:3.3),
            Tutor(email:"natka@wp.pl",name: "Natalia", surname: "Kowalska", description: "Jestem nauczycielką od 2 lat. Język angielski to moja pasja.", profilImg: "natalia",subjects:[Subjects(name: "Język angielski", price: 70)],score:4.3),
            Tutor(email:"brunek@wp.pl",name: "Bruno", surname: "Słowacki", description: "Jestem nauczycielką od 2 lat. Matematyka to moja pasja.", profilImg: "bruno",subjects: [Subjects(name: "Historia", price: 90),Subjects(name: "Geografia", price: 110)],score:2.3)
        ]
    }
    //
    
}
