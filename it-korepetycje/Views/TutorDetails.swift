//
//  TutorDetails.swift
//  ITKorepetycje
//
//  Created by Jakub Chudzik on 13/11/2021.
//

import SwiftUI

struct TutorDetails: View {
    var tutor:Tutor
    var body: some View {
        VStack{
            Image(tutor.profilImg).resizable()
                .aspectRatio(contentMode:.fill)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .shadow(radius: 10)
            Text("\(tutor.name) \(tutor.surname)")
            HStack{
                Group{
                    Button("O MNIE"){
                        
                    }
                    .offset(x:-30)
                    Divider().frame( height: 20)
                        .background(Color.black)
                    Button("REZERWUJ")
                    {
                        
                    }
                    .offset(x:30)
                }
                .foregroundColor(.black)
                .padding()
                .offset(y:30)
            }
            .padding()
            Divider().background(Color.black)

            Text(tutor.description)
                .offset(y:30)
            Spacer()
        }
        .background(Image("tlo"))
        //.navigationBarTitle("Title View1")
    }
}

struct TutorDetails_Previews: PreviewProvider {
    static var previews: some View {
        TutorDetails(tutor: Tutor(email:"maksiu123@wp.pl",name: "Maksymilian", surname: "Bąk", description: "Jestem nauczycielem od 5 lat. Matematyka i fizyka to moja pasja.", profilImg: "testowy",subjects: ["Matematyka":100,"Fizyka":90],score:3.3))
    }
}
