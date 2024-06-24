//
//  CommonTextFieldView.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 22.06.24.
//

import SwiftUI

import SwiftUI

struct CommonTextField: View {
    
    var placeholder: String
    @Binding var text: String
    
    
    private let height = 64.0
    private let padding = 12.0
    private let spacing = 0.0
    private let cornerradius = 8.0
        
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white.opacity(0.9)
            TextField(LocalizedStringKey(placeholder), text: $text)
                .font(.callout)
                .foregroundColor(.black)
                .accentColor(.blue)
                .multilineTextAlignment(.leading)
                .padding(padding)

        }.frame(height: height)
            .cornerRadius(CGFloat(cornerradius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerradius)
                    .stroke(AppColors.Style.stroke, lineWidth: 0.5)
                    .foregroundColor(.clear)
                    

            }
            

    }
}
