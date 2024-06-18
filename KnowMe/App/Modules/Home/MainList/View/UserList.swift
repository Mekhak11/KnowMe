//
//  UserList.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 19.02.24.
//

import SwiftUI

struct UserList<M: UserListViewModeling>: View {
    @ObservedObject var viewModel: M = UserListViewModel(getUsersUseCase: GetUsersUseCase()) as! M
    var body: some View {
        Text("UserList")
    }
}
