//
//  ContentView.swift
//  it-korepetycje
//
//  Created by Jakub Chudzik on 31/12/2021.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct ContentView: View {
    @ObservedObject var model = ViewModel()
    let storage = Storage.storage()
    var body: some View {
        List(model.list){item in
            Text(item.password)
            
        }
        
        // Reference to an image file in Firebase Storage

        //Login()
    }
    init(){
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
