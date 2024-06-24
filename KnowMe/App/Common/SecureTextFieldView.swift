//
//  SecureTextFieldView.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 22.06.24.
//

import SwiftUI

struct SecureTextField: View {
    var placeholder: String
    @Binding var text: String
    
    @State private var isSecure: Bool = true
    private let height = 64.0
    private let padding = 12.0
    private let spacing = 0.0
    
    var body: some View {
        return ZStack {
            Color.white.opacity(0.9)
            HStack(spacing: spacing) {
                if isSecure {
                    SecureField(LocalizedStringKey(placeholder), text: $text)
                        .font(.callout)
                        .foregroundColor(.black)
                        .accentColor(.blue)
                } else {
                    TextField(LocalizedStringKey(placeholder), text: $text)
                        .font(.callout)
                        .foregroundColor(.black)
                        .accentColor(.blue)
                }
                eyeButton
            }.padding(padding)
        }.frame(height: height).cornerRadius(8.0)
            .overlay {
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(AppColors.Style.stroke, lineWidth: 0.5)
                    .foregroundColor(.clear)
            }
    }
    
    var eyeButton: some View {
        Button {
            isSecure.toggle()
        } label: {
            isSecure ? AppImages.TextField.eye : AppImages.TextField.closedEye
        }
    }
}
