//
//  UserDefaults+Extensions.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 17.06.24.
//

import Foundation

extension UserDefaults {
    
    struct Key: RawRepresentable {
        var rawValue: String
    }
}

extension UserDefaults.Key {
    
    struct User {
        
        static let token = UserDefaults.Key(rawValue: "User.token")
        
    }
    
    struct Settings {
        
        static let language = UserDefaults.Key(rawValue: "Settings.language")
        
    }
}
