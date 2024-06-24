//
//  CommonButtonView.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 22.06.24.
//

import SwiftUI

struct CommonButton: View {
    
    var type: `Type` = .primary
    var color: Color = AppColors.Common.appBlue
    var backgroundColor: Color? = nil
    var action: (() -> Void)? = nil
    let title: String
    @Binding var isContentValid: Bool
    @Binding var isLoading: Bool
    
    init(type: `Type` = .primary, color: Color = AppColors.Common.appBlue, backgroundColor: Color? = nil, action: (() -> Void)? = nil, title: String, isContentValid: Binding<Bool> = .constant(true), isLoading: Binding<Bool> = .constant(false)) {
        self.type = type
        self.color = color
        self.backgroundColor = backgroundColor
        self.action = action
        self.title = title
        self._isContentValid = isContentValid
        self._isLoading = isLoading
    }
    
    var body: some View {
        ZStack {
            switch type {
            case .primary:
                if isContentValid {
                    backgroundColor ?? AppColors.Common.appBlue
                } else {
                   Color("style.invalid")
                }
            case .secondary:
                Color.clear
                    .border(color)
            }
            
            if let action = action {
                Button(action: action, label: {
                    ZStack {
                        switch type {
                        case .primary:
                            isContentValid ? backgroundColor ??
                            AppColors.Common.appBlue
                            :
                            Color("style.invalid")
                        case .secondary:
                            Color.clear
                                .border(color)
                        }
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            label
                        }
                    }
                }).disabled(!isContentValid)
            } else {
                label
            }
        }.frame(height: 54).cornerRadius(25)
    }
    
    private var label: some View {
        Text(LocalizedStringKey(title))
            .font(.subheadline)
            .foregroundColor(isContentValid ? .white : .gray)
    }
}

extension CommonButton {
    enum `Type` {
        case primary, secondary
    }
}
