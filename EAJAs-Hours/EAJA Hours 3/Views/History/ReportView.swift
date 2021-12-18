//
//  ReportView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/6/21.
//

import SwiftUI

struct ReportView: View {
    
    var reports: Reports
    let dateFormatter = DateFormatter()
    
    init(reports:Reports){
        self.reports = reports
        dateFormatter.dateFormat = "MMM d, YYYY, h:mm"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
    }
    
    var body: some View {
        VStack{
            Text(dateFormatter.string(from: reports.date))
                .foregroundColor(.gray)
                .padding()
            Text(reports.caseX)
                .fontWeight(.bold)
                .font(.system(size: 20))
            Text("Description: "+reports.descriptionX)
                .foregroundColor(.gray)
                .padding()
            Text("Hours spent: "+String(reports.hours))
                .foregroundColor(.gray)
                .padding()
        
            HStack{
                Button(action: {
                    print("go to editer view")
                }) {
                    Text("Edit Report")
                        .padding()
                        .foregroundColor(.green)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.green, lineWidth: 1)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                        )
                }
                Button(action: {
                    print("go to delete view")
                }) {
                    Text("Delete Report")
                        .padding()
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.red, lineWidth: 1)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                        )
                }
                    
            }
            Spacer()
        }
        
    }
}
