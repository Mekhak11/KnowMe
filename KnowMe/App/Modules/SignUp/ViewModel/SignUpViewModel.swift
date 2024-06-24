//
//  SignUpViewModel.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 23.06.24.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    
    @Published var user: UserSignUpModel = UserSignUpModel(firstName: "", lastName: "", email: "", phoone: "",password: "",nickName: "")
    @Published var repeatPass = ""
    @Published var isContentValid = false
    
    private var cancelables = Set<AnyCancellable>()
    private var signUpUseCase: SignUpUseCase
    
    init(signUpUseCase: SignUpUseCase) {
        self.signUpUseCase = signUpUseCase
        validate()
    }
    
    private func validate() {
        Publishers.CombineLatest($user, $repeatPass)
            .map { user, repeatPass in
                return (user.password == repeatPass) && !user.email.isEmpty && !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty && !user.phoone.isEmpty && !user.nickName.isEmpty && !user.password.isEmpty
            }.assign(to: &$isContentValid)
    }
    
    func signUp(complition: @escaping ()->()) {
        let payload = SignUpPayLoad(email: user.email, password: user.password, firstName: user.firstName, lastName: user.lastName, phone: user.phoone, nickName: user.nickName)
        signUpUseCase.execute(payload: payload)
            .sink { [weak self] result in
                switch result {
                case .finished:
                   print("Finished Sign UP")
                case .failure(let error):
                    print(print(error))
                }
            } receiveValue: { [weak self]  signUPresult in
                DispatchQueue.main.async {
                   print(signUPresult)
                    complition()
                }
            }.store(in: &cancelables)
        }
    
    }
    

