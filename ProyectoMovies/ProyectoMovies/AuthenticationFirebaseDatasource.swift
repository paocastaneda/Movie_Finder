//
//  AuthenticationFirebaseDatasource.swift
//  ProyectoMovies
//
//  Created by Paulina on 21/05/23.
//

import Foundation
import FirebaseAuth

struct User
{
    let email: String
}

final class AuthenticationFirebaseDatasource
{
    func getCurrentUser() -> User?
    {
        guard let email = Auth.auth().currentUser?.email else
        {
            return nil
        }
        return .init(email: email)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result <User, Error>) -> Void)
    {
        Auth.auth().createUser(withEmail: email, password: password) {authDataResult, error in if let error = error
        {
        print("Error creating a new user \(error.localizedDescription)")
        completionBlock(.failure(error))
        return
        
    }
            let email = authDataResult?.user.email ?? "No email"
        print("New user created with info \(email)")
        completionBlock(.success(.init(email: email)))
        
        }
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result <User, Error>) -> Void)
    {
        Auth.auth().signIn(withEmail: email, password: password) {authDataResult, error in if let error = error
        {
        print("Error login user \(error.localizedDescription)")
        completionBlock(.failure(error))
        return
        
    }
            let email = authDataResult?.user.email ?? "No email"
        print("User login with info \(email)")
        completionBlock(.success(.init(email: email)))
        
        }
    }
    
    func logout() throws
    {
        try Auth.auth().signOut()
    }
}
