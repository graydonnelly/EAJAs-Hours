//
//  HistoryView.swift
//  EAJA Hours 2
//
//  Created by Isi Donnelly on 7/28/21.
//

import SwiftUI

struct HistoryView: View {
    
        @State var searchFilter: String = ""
        
        var body: some View {
            
            NavigationView{
                VStack(alignment: .leading){
                    Text("Tap a report to view details")
                        .foregroundColor(.gray)
                        .padding(.leading,15)
                    SearchView(searchFilter: $searchFilter)
                    ReportListView(searchFilter: $searchFilter)
                }
                .navigationTitle("My Reports")
            }
            
        }
    
}

