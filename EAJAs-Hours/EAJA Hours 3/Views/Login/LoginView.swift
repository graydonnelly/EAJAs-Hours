//
//  LoginView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/23/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @ObservedObject var loginVM:LoginViewModel
    let defaults = UserDefaults.standard
    
    var body: some View {
        
        NavigationView{
        VStack{
            Text("Login")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.bottom, 20)
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
            
                Network.login(email: email, password: password)
                loginVM.isLoggedIn = true
                defaults.set(email, forKey: "email")
                defaults.set(password, forKey: "password")
                
                
            }) {
                Text("Login")
                    .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .shadow(color: .green, radius: 2.0)
                        )
            }
            .padding(.top, 30)
            
            HStack{
                Text("Don't have an account?")
                    .font(.system(size: 15))
                NavigationLink(destination: CreateAccountView(loginVM: loginVM)) {
                    Text("Create Account")
                        .font(.system(size: 18))
                        .foregroundColor(.blue)
                            }
            }
            .padding(.top, 40)
            
        }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

