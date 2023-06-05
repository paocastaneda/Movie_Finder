//
//  LoginEmailView.swift
//  ProyectoMovies
//
//  Created by Paulina on 21/05/23.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    var body: some View {
        VStack
        {
            DismissView().padding(.top, 8)
            Group
            {
                Text("Bienvenido a").bold().foregroundColor(.white)
                Text("Movie Finder").bold().foregroundColor(.yellow)
                
            }.padding(.horizontal, 8).multilineTextAlignment(.center).font(.largeTitle).tint(.primary)
            
            Group{
                Text("Log in para poder acceder a la app").tint(.secondary).multilineTextAlignment(.center).padding(.top,2).padding(.bottom, 2).foregroundColor(.white)
                TextField("Añade tu correo electronico",text: $textFieldEmail)
                TextField("Añade tu contraseña",text: $textFieldPassword)
                Button("Login")
                       {
                           authenticationViewModel.login(email: textFieldEmail, password: textFieldPassword)
                       }.padding(.top, 18).buttonStyle(.bordered).tint(.blue).foregroundColor(.cyan)
                if let messageError = authenticationViewModel.messageError
                {
                    Text(messageError).bold().font(.body).foregroundColor(.red).padding(.top, 20)
                }
            }.textFieldStyle(.roundedBorder).padding(.horizontal,64)
            Spacer()
            
        }.background(Color(red: 61/255, green:61/255, blue: 88/255))
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
