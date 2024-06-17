//
//  Date+Extension.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 01.02.24.
//

import Foundation

extension Date {
    func calculateAge() -> String {
        let now = Date()
        let calendar = Calendar.current

        let ageComponents = calendar.dateComponents([.year], from: self, to: now)

        return "\(ageComponents.year ?? 0)"
    }
}
