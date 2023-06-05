//
//  ProyectoMoviesApp.swift
//  ProyectoMovies
//
//  Created by Paulina on 18/05/23.
//

import SwiftUI
import Firebase
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate
{
    func application(_ application: UIApplication,
       didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       FirebaseApp.configure()
       return true
     }
}

@main
struct MovieLookupApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup{
            if let user = authenticationViewModel.user
            {
                HomeView(authenticationViewModel: authenticationViewModel)
            } else
            {
                AuthenticationView(authenticationViewModel: authenticationViewModel)
            }
        }
        
   
//        WindowGroup {
//            TabView {
//                DiscoverView()
//                    .tabItem {
//                        Image(systemName: "popcorn")
//                    }
//            }
//        }
    }
}

