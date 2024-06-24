//
//  SignInViewModel.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 23.06.24.
//

import Foundation
import Auth0
import Combine

final class SignInViewModel: ObservableObject {
    @Published var user: SignInModel = SignInModel(email: "", password: "")
        
    private var cancelables = Set<AnyCancellable>()
    private var signInUseCase: SignInUseCase
    
    init(signInUseCase: SignInUseCase) {
        self.signInUseCase = signInUseCase
    }
    
    func signIn(complition: @escaping (()->()?)) {
        let payload = SignInPayload(email: user.email, password: user.password)
        signInUseCase.execute(payload: payload)
        .sink { [weak self] result in
            switch result {
            case .finished:
               print("Finished Sign In")
            case .failure(let error):
                print(print(error))
            }
        } receiveValue: { [weak self]  signInResult in
            DispatchQueue.main.async {
               print(signInResult)
                complition()
            }
        }.store(in: &cancelables)
    }
}
