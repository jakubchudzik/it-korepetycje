
import SwiftUI

struct Login: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
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
                TextField(text: $viewModel.email, prompt: Text("E-mail")) {
                    Text("Username")
                }
                SecureField(text: $viewModel.password, prompt: Text("Hasło")) {
                    Text("Password")
                }
            }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .padding(10)
                .shadow(radius: 3)
                .frame(width:400)
                
            Button("Zaloguj") {
                viewModel.login()
            }.fullScreenCover(isPresented: $viewModel.isPresented, content: AboutTutor.init)

            .foregroundColor(.white)
            .font(.title)
            .frame(width: 150)
            .padding()
            .background(RoundedRectangle(cornerRadius: 40).fill(Color(red: 62.0/255.0, green: 163.0/255.0, blue: 190.0/255.0)))
            Group {
                Text(viewModel.descriptionError)
                    .foregroundColor(.red)
                    .opacity(viewModel.isEnabledErrorTextView ? 1.0 : 0.0)
                
                Button("Załóż konto") {
                    self.viewModel.gotoRegistration()
                }
                .fullScreenCover(isPresented: $viewModel.isPresentedRegistration, content: Registration.init)
//                Button("Nie pamiętasz hasła?")
//                {
//                    //tez cos
//                }
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
