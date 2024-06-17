//
//  JsonReader.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 19.02.24.
//

import Foundation

final class JsonReader {
    
    public static var reader: JsonReader = JsonReader()
    
    private init() { }
    
    func readJson<T: Codable>(from name: String) -> T? {
           do {
              if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
              let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                  
                      let ret = try? JSONDecoder().decode(T.self, from: jsonData)
                      return ret
              }
               return nil
           } catch {
              print(error)
               return nil
           }
        }
    
}
