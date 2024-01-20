//
//  Auth_SwiftUI_FirebaseApp.swift
//  Auth-SwiftUI-Firebase
//
//  Created by Harry Kwesi De Graft on 18/01/24.
//

import SwiftUI
import Firebase

@main
struct Auth_SwiftUI_FirebaseApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
