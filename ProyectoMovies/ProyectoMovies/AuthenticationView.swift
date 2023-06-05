//
//  AuthenticationView.swift
//  ProyectoMovies
//
//  Created by Paulina on 18/05/23.
//

import Foundation
import SwiftUI

enum AuthenticationSheetView: String, Identifiable
{
    case register
    case login
    var id: String
    {
        return rawValue
    }
}

struct AuthenticationView: View
{
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheetView:AuthenticationSheetView?
    var body: some View
    {
       
        VStack
        {
            VStack
            {
                //           Image("logofinal").resizable().frame(width: 200, height: 200)
                
                Text("MOVIE").font(.system(size: 40)).foregroundColor(.yellow).bold()
                Image(systemName: "popcorn") .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
                    .foregroundColor(.white)
                Text("FINDER").font(.system(size: 30)).foregroundColor(.yellow).bold()
                
                VStack
                {
                    Button
                    {
                        authenticationSheetView = .login
                    } label:
                    {
                        Label("Login con email", systemImage: "envelope.fill")
                    }.tint(.black).foregroundColor(.white)
                }.controlSize(.large).buttonStyle(.bordered).buttonBorderShape(.capsule).padding(.top,60)
                //            Spacer()
                HStack
                {
                    Button
                    {
                        authenticationSheetView = .register
                    } label:
                    {
                        Text("¿No tienes cuenta?")
                        Text("Registrate").underline().bold()
                    }.foregroundColor(.cyan)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color(red: 61/255, green:61/255, blue: 88/255)).ignoresSafeArea().sheet(item: $authenticationSheetView)
            {
                sheet in switch sheet{
                case .register: RegisterEmailView(authenticationViewModel: authenticationViewModel)
                case .login:
                    LoginEmailView(authenticationViewModel: authenticationViewModel)
                }
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider
{
    static var previews: some View
    {
        AuthenticationView(authenticationViewModel: AuthenticationViewModel())
    }
}


