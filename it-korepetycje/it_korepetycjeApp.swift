//
//  it_korepetycjeApp.swift
//  it-korepetycje
//
//  Created by Jakub Chudzik on 31/12/2021.
//

import SwiftUI
import Firebase

@main
struct it_korepetycjeApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
