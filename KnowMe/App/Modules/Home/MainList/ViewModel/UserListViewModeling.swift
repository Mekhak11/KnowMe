//
//  UserListViewModeling.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 19.02.24.
//

import Foundation

protocol UserListViewModeling: ObservableObject {
    var userList: [PersonModel] { get set}
    
    func getUserList()
}
