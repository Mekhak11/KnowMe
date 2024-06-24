//
//  SignInUseCase.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 25.06.24.
//

import Foundation
import Combine
import Auth0

final class SignInUseCase: AuthUseCase {
    func execute(payload: SignInPayload) -> AnyPublisher<SignInResponseModel, AuthenticationError> {
        authRepository.signIn(payload: payload)
            .start()
            .map {
                SignInResponseModel(auth0Dto: $0)
            }.eraseToAnyPublisher()
    }
}
