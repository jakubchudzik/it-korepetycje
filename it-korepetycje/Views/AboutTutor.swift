//
//  AboutTutor.swift
//  ITKorepetycje
//
//  Created by Jakub Chudzik on 13/11/2021.
//

import SwiftUI

struct AboutTutor: View {
    let tutors = Tutor.all()
    var body: some View {
        VStack{
            List(self.tutors, id:\.email){tutor in
                TutorCell(tutor:tutor)
                }
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
    var body: some View {
        HStack{
            Image(tutor.profilImg)
                .resizable()
                .aspectRatio(contentMode:.fill)
                .frame(width: 90, height: 90)
                .clipped()
                .cornerRadius(20)
            VStack(alignment:.leading){
                Text(tutor.name).font(.title3)
                Text(tutor.sube()).font(.caption)
                //                    Text(String(format:"%.1f",tutor.score))
                Group{
                    if(tutor.score>=4) 
                    {
                        Text("⭐️⭐️⭐️⭐️⭐️")
                    }
                    else if(tutor.score>=3)
                    {
                        Text("⭐️⭐️⭐️⭐️")
                    }
                    else if(tutor.score>=2)
                    {
                        Text("⭐️⭐️⭐️")
                    }
                    else if(tutor.score>=1)
                    {
                        Text("⭐️⭐️")
                    }
                    else if(tutor.score>=0)
                    {
                        Text("⭐️")
                    }
                }
                .font(.caption)
                .offset()
            }
            Spacer()
            NavigationLink(destination: TutorDetails(tutor:tutor),label:{Text("Więcej")}).font(.caption)
                .frame(width: 70)
                .navigationBarBackButtonHidden(true)
            
        }
    }
}
