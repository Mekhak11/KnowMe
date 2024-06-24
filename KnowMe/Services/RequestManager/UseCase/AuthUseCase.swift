//
//  AuthUseCase.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 25.06.24.
//

import Foundation

import Foundation

class AuthUseCase {
    let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
}
