//
//  SignUpView.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 22.06.24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var signUpViewModel: SignUpViewModel = SignUpViewModel(signUpUseCase: SignUpUseCase(authRepository: Auth0AuthDefaultRepository()))
    var body: some View {
        ZStack {
            AppImages.Background.common
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            content
        }
    }
}

extension SignUpView {
    private var content: some View {
        ScrollView {
            VStack(spacing: 32) {
                Spacer()
                title
                textField
                signUpButton
                Spacer()
            }.padding(16)
        }
    }
    
    private var title: some View {
        VStack(spacing: 16) {
            Text("Sign Up")
                .foregroundColor(.black)
                .font(.title)
            Text("Fill in your details to register")
                .foregroundColor(.black)
                .font(.body)
        }
    }
    
    private var textField: some View {
        VStack(spacing: 16) {
            CommonTextField(placeholder: "First Name", text: $signUpViewModel.user.firstName)
            CommonTextField(placeholder: "Last Name", text: $signUpViewModel.user.lastName)
            CommonTextField(placeholder: "Phone number", text: $signUpViewModel.user.phoone)
            CommonTextField(placeholder: "E-mail", text: $signUpViewModel.user.email)
            CommonTextField(placeholder: "Username", text: $signUpViewModel.user.nickName)
            SecureTextField(placeholder: "Password", text: $signUpViewModel.user.password)
            SecureTextField(placeholder: "Password", text: $signUpViewModel.repeatPass )
        }
    }
    
    private var signUpButton: some View {
        CommonButton(
            action: {
                signUpViewModel.signUp {
                    presentationMode.wrappedValue.dismiss()
                }
        }, title: "Sign Up",
        isContentValid: $signUpViewModel.isContentValid)
    }
}
