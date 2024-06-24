//
//  AuthRepository.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 25.06.24.
//

import Foundation
import Auth0

protocol AuthRepository {
    func signup(payload: SignUpPayLoad) -> Request<DatabaseUser, AuthenticationError>
    func signIn(payload: SignInPayload) -> Request<Credentials, AuthenticationError>
}

final class Auth0AuthDefaultRepository : AuthRepository {

    private let auth0 = Auth0.authentication()
    
    func signup(payload: SignUpPayLoad) -> Request<DatabaseUser, AuthenticationError> {
        let userMetadata = ["firstName" : payload.firstName, "lastName" : payload.lastName, "email" : payload.email, "phone" : payload.phone, "username" : payload.nickName]
        return auth0.signup(email: payload.email, password: payload.password, connection: "Username-Password-Authentication", userMetadata: userMetadata)
    }
    
    func signIn(payload: SignInPayload) -> Request<Credentials, AuthenticationError> {
       return auth0.login(
        usernameOrEmail: payload.email,
        password: payload.password,
            realmOrConnection: "Username-Password-Authentication",
            audience: "https://dev-4yve6xuhxtovc3nm.us.auth0.com/api/v2/",
            scope: "openid profile"
        )
    }
    
}
