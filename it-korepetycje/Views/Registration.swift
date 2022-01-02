//
//  Registration.swift
//  ITKorepetycje
//
//  Created by Jakub Chudzik on 13/11/2021.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct Registration: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack{
            Text("Rejestracja")
                .font(.largeTitle)
                .foregroundColor(Color(red: 94.0/255.0, green: 99.0/255.0, blue: 103.0/255.0))
                .offset(y:-40)
            Image("logo")
                .offset(y:-20)
                
            Group{
                TextField(text: $viewModel.email, prompt: Text("E-mail")) {
                    Text("Username")
                }
//                TextField(text: $name, prompt: Text("Nazwa")) {
//                    Text("Password")
//                }
                SecureField(text: $viewModel.password, prompt: Text("Hasło")) {
                    Text("Password")
                }
                SecureField(text: $viewModel.password2, prompt: Text("Powtórz hasło")) {
                    Text("Password")
                }
            }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .padding(10)
                .shadow(radius: 3)
                .frame(width:400)
        
                
            Button("Załóż konto") {
                viewModel.createUser()
            }
            .fullScreenCover(isPresented: $viewModel.isPresented, content: AboutTutor.init)
            .foregroundColor(.white)
            .font(.title)
            .frame(width: 180)
            .padding()
            .background(RoundedRectangle(cornerRadius: 40).fill(Color(red: 62.0/255.0, green: 163.0/255.0, blue: 190.0/255.0)))
            .offset(y:20)
            Text(viewModel.descriptionError)
                .foregroundColor(.red)
                .offset(y:40)
                .opacity(viewModel.isEnabledErrorTextView ? 1.0 : 0.0)
            Spacer()
            Button("Zamknij") {
                presentationMode.wrappedValue.dismiss()
            }
            .offset(y: -40)
        }
        .background(Image("tlo"))
        .ignoresSafeArea()
    }
    
    private func handleAction(){
        createNewAccount()
    }
    private func createNewAccount(){

    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
