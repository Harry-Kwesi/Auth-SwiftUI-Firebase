//
//  ProfileView.swift
//  Auth-SwiftUI-Firebase
//
//  Created by Harry Kwesi De Graft on 18/01/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment:.leading, spacing: 4){
                            Text(user.fullname)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            
                            Text(user.email)
                                .accentColor(.gray)
                        }
                    }
                }
                Section("General"){
                    HStack{
                        SettingsRowView(imageName: "gear",
                                        title: "Version",
                                        tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                    }
                    
                }
                Section("Account"){
                
                        Button(action: {
                            viewModel.signOut()
                        }, label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: Color(.red))
                        })
                        Button(action: {
                            print("Delete account...")
                        }, label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.red))
                        })
                    
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
