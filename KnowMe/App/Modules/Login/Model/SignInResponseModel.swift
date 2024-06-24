//
//  SignInResponseModel.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 25.06.24.
//

import Foundation
import Auth0


struct SignInResponseModel {
           var accessToken: String
           var tokenType: String
           var idToken: String
           var refreshToken: String?
           var expiresIn: Date
           var scope: String?
           var recoveryCode: String?
    
    init(accessToken: String, tokenType: String, idToken: String, refreshToken: String? = nil, expiresIn: Date, scope: String? = nil, recoveryCode: String? = nil) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.idToken = idToken
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
        self.scope = scope
        self.recoveryCode = recoveryCode
    }
    
    init(auth0Dto: Credentials) {
        self.accessToken = auth0Dto.accessToken
        self.tokenType = auth0Dto.tokenType
        self.idToken = auth0Dto.idToken
        self.refreshToken = auth0Dto.refreshToken
        self.expiresIn = auth0Dto.expiresIn
        self.scope = auth0Dto.scope
        self.recoveryCode = auth0Dto.recoveryCode
    }
}
