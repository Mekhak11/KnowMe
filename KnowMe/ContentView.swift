//
//  ContentView.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 01.02.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UserList<UserListViewModel>()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
