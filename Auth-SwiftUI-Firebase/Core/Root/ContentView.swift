//
//  ContentView.swift
//  Auth-SwiftUI-Firebase
//
//  Created by Harry Kwesi De Graft on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
//            LoginView()
//            ProfileView()
        }
    }
}

#Preview {
    ContentView()
}
