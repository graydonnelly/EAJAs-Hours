//
//  ReporterView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/3/21.
//

import SwiftUI

struct ReporterView: View {
    
    //@State var isEditing = false
    var placeholderText = "Description of what I did"
    @State var description: String = "Description of what I did"
    @State var hours: String = ""
    @State var minutes: String = ""
    @State var selectedDate:Date = Date()
    @State var isDroppedDown = false
    @State var selectedCase = Cases()
    
    static let options: [Cases] = Network.getCases()
    
    
    var body: some View {
        ScrollView{
        VStack{
            Text("Report Hours")
                .fontWeight(.bold)
                .font(.system(size: 40))
                .padding(.bottom, 20)
            
            DropdownSelector(
                placeholder: "Case",
                options: ReporterView.options,
                onOptionSelected: { option in
                    selectedCase = option
                },
                onDropdownToggle: {isDroppedDown in
                    self.isDroppedDown = isDroppedDown
                }
                )
            .frame(height: 40)
            
            VStack{
                TextEditor(text: $description)
                    .font(.system(size: 14))
                    .foregroundColor(description == placeholderText ? Color.gray: Color.black)
                    .padding(.leading, 13)
                    .onTapGesture {
                        //isEditing.toggle()
                        if description == placeholderText{description = ""}
                        //if !isEditing && description == ""{description = placeholderText}
                    }
                    
            }.offset(y: isDroppedDown ? 220: 0)
            .frame(minHeight: 100, maxHeight: 100)
            .padding(.trailing,12)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .offset(y: isDroppedDown ? 220: 0)
            )
            
            HStack(){
                TextField("Hours Spent", text: $hours)
                    .font(.system(size: hours == "" ? 14: 20))
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 10)
                    .frame(minHeight: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                            .padding(.leading, 10)
                            
                    )
                TextField("Minutes Spent", text: $minutes)
                    .font(.system(size: minutes == "" ? 14: 20))
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(minHeight: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .padding(.trailing, 20)
                    .frame(minHeight: 50)
                    
            }.offset(y: isDroppedDown ? 220: 0)
            
            
            Button(action: {
                do {try Helper.submitReport(date: selectedDate, hours: hours, minutes: minutes, description: description, cases: selectedCase)
                    print("YEET")
                }
                catch{
                    print("FUCK")
                }
            }) {
                Text("Submit Report")
                    .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .shadow(color: .green, radius: 2.0)
                        )
            }.offset(y: isDroppedDown ? 220: 0)
            .padding(.top, 30)
            
        }
        }.frame(height:550)
        }
    }
