//
//  CreateAccountView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/23/21.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State var email = ""
    @State var password = ""
    @State var firstName = ""
    @State var lastName = ""
    @ObservedObject var loginVM:LoginViewModel
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack{
            Text("Create Account")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.bottom, 20)
            TextField("First Name", text: $firstName)
                .font(.system(size: firstName == "" ? 14: 16))
                .multilineTextAlignment(.center)
                .padding()
                .frame(minHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                )
            TextField("Last Name", text: $lastName)
                .font(.system(size: lastName == "" ? 14: 16))
                .multilineTextAlignment(.center)
                .padding()
                .frame(minHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                )
            Text("")
            TextField("Email", text: $email)
                .font(.system(size: email == "" ? 14: 16))
                .keyboardType(.emailAddress)
                .multilineTextAlignment(.center)
                .padding()
                .frame(minHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                )
            SecureField("Password", text: $password)
                .font(.system(size: password == "" ? 14: 16))
                .multilineTextAlignment(.center)
                .padding()
                .frame(minHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                )
            
            Button(action: {
               
                Network.createAccountAndLogin(firstName: firstName, lastName: lastName, email: email, password: password)
                //Network.login(email: email, password: password)
                //loginVM.isLoggedIn = true
                defaults.set(email, forKey: "email")
                defaults.set(password, forKey: "password")
                
            }) {
                Text("Create Account")
                    .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .shadow(color: .green, radius: 2.0)
                        )
            }
            .padding(.top, 30)
            
            HStack{
                Text("Already have an account?")
                    .font(.system(size: 15))
                NavigationLink(destination: LoginView(loginVM: loginVM)) {
                    Text("Login")
                        .font(.system(size: 18))
                        .foregroundColor(.blue)
                            }
            }
            .padding(.top, 40)
            
        }
            .navigationBarHidden(true)
    }
}
