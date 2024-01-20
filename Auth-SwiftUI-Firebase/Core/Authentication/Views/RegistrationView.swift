//
//  RegistrationView.swift
//  Auth-SwiftUI-Firebase
//
//  Created by Harry Kwesi De Graft on 18/01/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        VStack{
            //image
            Image(systemName: "person.fill.checkmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150,height: 120)
                .padding(.vertical)
            
            //form fields
            VStack(spacing: 24){
                InputView(text: $email,
                          title:"Email address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullname,
                          title:"Full Name",
                          placeholder: "Enter your name")
                
                InputView(text: $password,
                          title:"Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing){
                    InputView(text: $confirmPassword,
                              title:"Confirm Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        if password == confirmPassword{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        }else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            //sign in button
            Button(action: {
                Task {
                    try await viewModel.createUser(withEmail:email,
                                                   password:password,
                                                   fullName:fullname)
                }
            }, label: {
                HStack{
                    Text("SIGN UP")
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
            
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 2){
                    Text("Already have an account")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            })
        }
    }
}

//MARK - AuthenticationFormProtocol

extension RegistrationView : AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
