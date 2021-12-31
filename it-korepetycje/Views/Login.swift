
import SwiftUI

struct Login: View {
    @State private var email:String = ""
    @State private var password:String = ""
    
    var body: some View {
        NavigationView{
        VStack{
            Spacer()
//            Circle()
//                .frame(width: 200, height: 200, alignment:.leading).offset(x:-200,y:-100)
//                .ignoresSafeArea()
//                .foregroundColor(Color(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0))
//                .shadow(radius: 7)
            
//            Text("Witaj!")
                .font(.largeTitle)
                .foregroundColor(Color(red: 94.0/255.0, green: 99.0/255.0, blue: 103.0/255.0))
            Image("logo")
                
            Group{
                TextField(text: $email, prompt: Text("E-mail")) {
                    Text("Username")
                }
                SecureField(text: $password, prompt: Text("Hasło")) {
                    Text("Password")
                }
            }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .padding(10)
                .shadow(radius: 3)
                .frame(width:400)
                
//            Button("Zaloguj"){
//                //cos tam bedzie
//            }
            NavigationLink(destination:AboutTutor(),label:{Text("Zaloguj")})
            .foregroundColor(.white)
            .font(.title)
            .frame(width: 150)
            .padding()
            .background(RoundedRectangle(cornerRadius: 40).fill(Color(red: 62.0/255.0, green: 163.0/255.0, blue: 190.0/255.0)))
            
            Group{
//                Button("Załóż konto"){
//
//                    //cos tam bedzie
//                }
                NavigationLink(destination: Registration(),label:{Text("Załóż konto")})
                Button("Nie pamiętasz hasła?")
                {
                    //tez cos
                }
                .offset(y:-30)
            }
            .padding()
            .foregroundColor(Color(red: 94.0/255.0, green: 99.0/255.0, blue: 103.0/255.0))
            
            Spacer()
            
        }
        .background(Image("tlo"))
            .ignoresSafeArea()
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
