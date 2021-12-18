//
//  LoginRootView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/23/21.
//

import SwiftUI

struct LoginRootView: View {
    
    @ObservedObject var loginVM:LoginViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Welcome to EAJA Hours!")
                NavigationLink(destination: LoginView(loginVM: loginVM)) {
                    Text("Login")
                        .font(.system(size: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                                .padding()
                                
                        )
                            }
                
                NavigationLink(destination: CreateAccountView(loginVM: loginVM)) {
                    Text("Create Account")
                        .font(.system(size: 18))
                        /*
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                
                        )
 */
                            }
            }
        }
    }
}
