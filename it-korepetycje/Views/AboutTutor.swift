//
//  AboutTutor.swift
//  ITKorepetycje
//
//  Created by Jakub Chudzik on 13/11/2021.
//

import SwiftUI

struct AboutTutor: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = TutorViewModel()
    
    
    @State var filteredText: String = ""
    
    var body: some View {
        
        let binding = Binding<String>(get: {
            self.filteredText
        }, set: {
            self.filteredText = $0
            
            if filteredText.isEmpty {
                viewModel.filteredList = viewModel.list
            } else {
                viewModel.filteredList = viewModel.list.filter { $0.subjects.contains(where: { $0.name.lowercased().contains(filteredText.lowercased()) })}
            }
            
        })
        Text("Napis")
        
        VStack {
            TextField("Wyszukaj po przedmiocie", text: binding)
                .foregroundColor(.gray)
            List(self.viewModel.filteredList, id:\.email) { tutor in
                TutorCell(tutor:tutor)
            }
            
            Button("Wyloguj") {
                presentationMode.wrappedValue.dismiss()
            }
            .foregroundColor(.red)
            Spacer()

        }.onAppear {
            viewModel.getTutor()
        }
    }
}

struct AboutTutor_Previews: PreviewProvider {
    static var previews: some View {
        AboutTutor()
    }
}

struct TutorCell: View {
    let tutor:Tutor
    
    @State var isPresentedDetails = false
    
    var body: some View {
        HStack {
            Image(tutor.profilImg)
                .resizable()
                .aspectRatio(contentMode:.fill)
                .frame(width: 90, height: 90)
                .clipped()
                .cornerRadius(20)
            VStack(alignment:.leading) {
                Text(tutor.name).font(.title3)
                    .foregroundColor(Color.black)
                Text(tutor.sube).font(.caption)
                    .foregroundColor(Color.black)
                //                    Text(String(format:"%.1f",tutor.score))
                Group{
                    if tutor.score >= 4 {
                        Text("⭐️⭐️⭐️⭐️⭐️")
                    }
                    else if tutor.score >= 3 {
                        Text("⭐️⭐️⭐️⭐️")
                    }
                    else if tutor.score >= 2 {
                        Text("⭐️⭐️⭐️")
                    }
                    else if tutor.score >= 1 {
                        Text("⭐️⭐️")
                    }
                    else if tutor.score >= 0 {
                        Text("⭐️")
                    }
                }
                .font(.caption)
                .offset()
            }
            Spacer()
                
            Button("Więcej") {
                self.isPresentedDetails = true
                MyFirebaseService.shared.selectedTutor = tutor
                
            }
            .fullScreenCover(isPresented: $isPresentedDetails, content: TutorDetails.init)
                .foregroundColor(.orange)
                .font(.caption)
                
            //.navigationBarBackButtonHidden(true)
        }
        
        
    }
}
