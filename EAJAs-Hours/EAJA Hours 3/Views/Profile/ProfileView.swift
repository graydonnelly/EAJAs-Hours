//
//  ProfileView.swift
//  EAJA Hours 2
//
//  Created by Isi Donnelly on 7/28/21.
//

import SwiftUI


struct ProfileView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    let defaults = UserDefaults.standard
    
    init () {
        if defaults.string(forKey: "firstNameDefault") == nil{
            defaults.set("", forKey: "firstNameDefault")
        }
        if defaults.string(forKey: "lastNameDefault") == nil{
            defaults.set("", forKey: "lastNameDefault")
        }
        
        _firstName = State(initialValue: defaults.string(forKey: "firstNameDefault")!)
        _lastName = State(initialValue: defaults.string(forKey: "lastNameDefault")!)
        
    }
    
    var body: some View {
       

        
        VStack{
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 74.0, height: 74.0)
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                .multilineTextAlignment(.center)
                .onChange(of: firstName) { firstName in
                    defaults.set(firstName, forKey: "firstNameDefault")
                }
                
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                .multilineTextAlignment(.center)
                .onChange(of: lastName) { lastName in
                    defaults.set(lastName, forKey: "lastNameDefault")
                }
        }
       
        }
    
    }



extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
    }
}

