//
//  SignUpView.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 22.06.24.
//

import SwiftUI
import Auth0
import JWTDecode


struct SignInView: View {
    
    @ObservedObject var signInViewModel = SignInViewModel(signInUseCase: SignInUseCase(authRepository: Auth0AuthDefaultRepository()))
    
    @State var isSignUp: Bool = false
    
    var body: some View {
        content
            .background(AppImages.Background.common)
//        ZStack {
//            AppImages.Background.common
//                .resizable()
//                .ignoresSafeArea(.all)
//                .scaledToFill()
//        }
    }
}

extension SignInView {
    
    private var content: some View {
       // ScrollView {
            VStack(spacing: 32)  {
                Spacer()
                HStack {
                    Spacer()
                    signUpButton
                }
               Spacer()
               title
               fields
               signInButton
               Spacer()
                divider
                Spacer()
                auth0OptionsSignUp
            }.padding(16)
      //  }.scrollIndicators(.hidden)
    }
    
    private var title: some View {
        VStack(spacing: 16) {
            Text("Sign In")
                .font(.title)
                .foregroundStyle(.black)
            Text("Enter your details to proceed further ")
                .font(.body)
                .foregroundStyle(.black)
        }
    }
    
    private var fields: some View {
        VStack(spacing: 16) {
            CommonTextField(placeholder: "Username/email/phone", text: $signInViewModel.user.email)
            SecureTextField(placeholder: "Password", text: $signInViewModel.user.password)
        }
    }
    
    private var signInButton: some View {
        CommonButton(action: {
            signInViewModel.signIn {
                print("Navigate")
            }
        }, title: "Sign In")
    }
    
    private var signUpButton: some View {
        
        NavigationLink(destination: SignUpView(), isActive: $isSignUp) {
            Button {
                isSignUp = true
            } label: {
                Text("Sign Up")
            }.buttonStyle(.borderedProminent)
        }
    
    }
    
    private var divider: some View {
        HStack {
            VStack {
                Divider()
                    .foregroundColor(AppColors.Style.stroke)
                    .padding()

            }
            Text("Or")
                .foregroundColor(AppColors.Style.stroke)
            VStack {
                Divider()
                    .foregroundColor(AppColors.Style.stroke)
                    .padding()
            }
                
        }.padding(30)
    }
    
    private var auth0OptionsSignUp: some View  {

            CommonButton(action: {
                login()
            }, title: "Sign Up with Auth0")
        }
    
    
}

extension SignInView {
    func login() {
        Auth0.webAuth()
            .start {
                result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let cred):
                    print(cred)
                    guard let jwt = try? decode(jwt: cred.idToken),
                          let name = jwt["name"].string,
                          let picture = jwt["picture"].string else { return }
                    print("Name: \(name)")
                    print("Picture URL: \(picture)")
                    
                }
            }
    }
    
    func logout() {
        Auth0.webAuth().clearSession(federated: true) { result in
            print(result)
        }
    }
}
