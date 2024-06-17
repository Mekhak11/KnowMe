//
//  UserListViewModel.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 19.02.24.
//

import Foundation

final class UserListViewModel: UserListViewModeling, Identifiable {
   @Published var userList: [PersonModel] = []
    
    private var getUsersUseCase: GetUsersUseCase
    
    init(getUsersUseCase: GetUsersUseCase) {
        self.getUsersUseCase = getUsersUseCase
    }
    
    func getUserList() {
        userList = getUsersUseCase.execute()
    }
    
    
}
