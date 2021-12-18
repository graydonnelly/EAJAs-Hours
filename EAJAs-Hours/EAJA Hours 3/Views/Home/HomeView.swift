//
//  HomeView.swift
//  EAJA Hours 2
//
//  Created by Isi Donnelly on 7/28/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchFilter: String = ""
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                Text("Tap a case to begin or report hours")
                    .foregroundColor(.gray)
                    .padding(.leading,15)
                SearchView(searchFilter: $searchFilter)
                CaseListView(searchFilter: $searchFilter)
            }
            .navigationTitle("Cases")
        }
    }
}

