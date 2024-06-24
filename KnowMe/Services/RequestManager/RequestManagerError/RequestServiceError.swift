//
//  RequestServiceError.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 17.06.24.
//

import Foundation
import Auth0

struct RequestServiceError: LocalizedError, Codable, Error {
    let message: String
    var path: [String]?
    var httpStatus: String?

    var statusCode: Int?

    var errorDescription: String? { message }
    var localizedDescription: String { message }
    var failureReason: String? { message }
    var recoverySuggestion: String? { message }
    var helpAnchor: String? { message }
    
    private enum CodingKeys : String, CodingKey {
        case message
    }
    
    init(message: String, httpStatus: String) {
        self.message = message
        self.httpStatus = httpStatus
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
    }
    
}
