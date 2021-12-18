//
//  RootView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/23/21.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var loginVM = LoginViewModel()
    let defaults = UserDefaults.standard
    
    var body: some View {
        
        if loginVM.isLoggedIn{
            MainView()
        }
        else{
            LoginRootView(loginVM: loginVM)
                .onAppear(){
                    if defaults.string(forKey: "email") != nil && defaults.string(forKey: "password") != nil{
                        //Network.login(email: defaults.string(forKey: "email")!, password: defaults.string(forKey: "password")!)
                        //loginVM.isLoggedIn = true
                    }
                }
        }
        
        
    }
}


