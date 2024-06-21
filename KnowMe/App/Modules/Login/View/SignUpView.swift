//
//  SignUpView.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 22.06.24.
//

import SwiftUI
import Auth0
import JWTDecode


struct SignUpView: View {
    var body: some View {
        VStack {
            Button {
                login()
            } label: {
                Text("Sign Up with Auth0")
                    .foregroundStyle(.blue)
            }
            
            Button {
                logout()
            } label: {
                Text("logout")
                    .foregroundStyle(.blue)
            }
        }
    }
}

extension SignUpView {
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

#Preview {
    SignUpView()
}
