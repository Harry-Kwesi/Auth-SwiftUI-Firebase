//
//  LoginView.swift
//  Auth-SwiftUI-Firebase
//
//  Created by Harry Kwesi De Graft on 18/01/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel    
    var body: some View {
        NavigationStack{
            VStack{
                //image
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 120)
                    .padding(.vertical)
                    
                
                //form fields
                VStack(spacing: 24){
                    InputView(text: $email,
                              title:"Email address",
                              placeholder: "name@example.com")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $password,
                              title:"Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //sign in button
                Button(action: {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                }, label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                })
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                //sign up button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 2){
                        Text("Dont have an account")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }

            }
        }
    }
}

//MARK - AuthenticationFormProtocol

extension LoginView : AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
