//
//  HomeView.swift
//  ProyectoMovies
//
//  Created by Paulina on 21/05/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
       NavigationView
        {
            VStack
            {
              DiscoverView()
             
            }.toolbar{
                Button("Logout")
                {
                    authenticationViewModel.logout()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(authenticationViewModel: AuthenticationViewModel())
    }
}
