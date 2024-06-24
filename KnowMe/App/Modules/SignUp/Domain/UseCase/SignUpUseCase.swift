//
//  SignUpUseCase.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 25.06.24.
//

import Foundation
import Auth0
import Combine

final class SignUpUseCase: AuthUseCase {
    func execute(payload: SignUpPayLoad) -> AnyPublisher<SignUpResponseModel, AuthenticationError> {
        authRepository.signup(payload: payload)
            .start()
            .map {
                SignUpResponseModel(dto: $0)
            }.eraseToAnyPublisher()
    }
}
