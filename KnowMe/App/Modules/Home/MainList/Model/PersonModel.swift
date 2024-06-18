//
//  PersonModel.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 01.02.24.
//

import Foundation
import SwiftUI
struct PersonModel: Codable {
    let nickName, goalHere, dateOfBirth: String
    let imageURL: String
    let social: [Social]
}

// MARK: - Social
struct Social: Codable {
    let id, userName: String
    let type: TypeEnum
}


enum TypeEnum: Codable {
    case tg, instagram, fb, snap, tt, twitter
    
    var image: Image {
        switch self {
        case .tg:
            return Image("insta")
        case .instagram:
            return Image("insta")
        case .fb:
            return Image("insta")
        case .snap:
            return Image("insta")
        case .tt:
            return Image("insta")
        case .twitter:
            return Image("insta")
        }
        
    }
}
