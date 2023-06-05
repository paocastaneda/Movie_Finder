//
//  AuthenticationRepository.swift
//  ProyectoMovies
//
//  Created by Paulina on 21/05/23.
//

import Foundation

final class AuthenticationRepository
{
    private let authenticationFirebaseDatasource: AuthenticationFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource())
    {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func getCurrentUser() -> User?
    {
        authenticationFirebaseDatasource.getCurrentUser()
    }
    
    func createnewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>)-> Void)
    {
        authenticationFirebaseDatasource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>)-> Void)
    {
        authenticationFirebaseDatasource.login(email: email, password: password, completionBlock: completionBlock)
    }
    
    
    func logout() throws 
    {
        try authenticationFirebaseDatasource.logout()
    }
}
