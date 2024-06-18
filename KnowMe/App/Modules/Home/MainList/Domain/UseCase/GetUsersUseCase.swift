//
//  GetUsersUseCase.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 19.02.24.
//

import Foundation

class GetUsersUseCase {
    func execute() -> [PersonModel] {
       return  JsonReader.reader.readJson(from: "du") ?? []
    }
}
