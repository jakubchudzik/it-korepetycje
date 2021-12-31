//
//  Tutor.swift
//  ITKorepetycje
//
//  Created by Jakub Chudzik on 13/11/2021.
//

import Foundation
import SwiftUI

struct Tutor:Identifiable{
    var id=UUID()
    var email:String
    var name:String
    var surname:String
    var description:String
    var profilImg:String
    var subjects: [String: Int] = [:]
    var score:Double
    
}

extension Tutor{
    func sube()->String{
        var pom = ""
        var x = 0
        subjects.keys.forEach{ i in
            pom = pom + i
            if (x < (subjects.keys).count-1)
            {
                pom = pom + ", "
            }
            x=x+1
        }
        return pom
    }
    static func all()->[Tutor]{
        return[
            Tutor(email:"maksiu123@wp.pl",name: "Maksymilian", surname: "Bąk", description: "Jestem nauczycielem od 5 lat. Matematyka i fizyka to moja pasja.", profilImg: "testowy",subjects: ["Matematyka":100,"Fizyka":90],score:3.3),
            Tutor(email:"natka@wp.pl",name: "Natalia", surname: "Kowalska", description: "Jestem nauczycielką od 2 lat. Język angielski to moja pasja.", profilImg: "natalia",subjects:["Język angielski":70],score:4.3),
            Tutor(email:"brunek@wp.pl",name: "Bruno", surname: "Słowacki", description: "Jestem nauczycielką od 2 lat. Matematyka to moja pasja.", profilImg: "bruno",subjects: ["Matematyka" : 120],score:2.3)
        ]
    }
    
}
