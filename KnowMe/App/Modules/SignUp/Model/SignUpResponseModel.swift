//
//  SignUpResponseModel.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 25.06.24.
//

import Foundation
import Auth0

struct SignUpResponseModel {
    var email: String
    var username: String?
    var verified: Bool
    
    init(email: String, username: String? = nil, verified: Bool) {
        self.email = email
        self.username = username
        self.verified = verified
    }
    
    init(dto: DatabaseUser) {
        self.email = dto.email
        self.username = dto.username
        self.verified = dto.verified
    }
}
