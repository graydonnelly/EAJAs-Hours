//
//  SearchView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/2/21.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchFilter: String
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 7)
                    .padding(.top, 7)
                    .padding(.bottom, 7)
                TextField("Search", text: $searchFilter)
                    .padding(.top, 7)
                    .padding(.bottom, 7)
                if searchFilter != ""{
                    Button(action: {searchFilter=""}, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    })
                    .padding(.trailing,7)
                }
            }
            .background(RoundedRectangle(cornerRadius: 15)
                            .fill(Color(.secondarySystemBackground)))
            Spacer()
        }
        .frame(maxHeight: 40)
        .padding(.leading)
        .padding(.trailing)
        .padding(.top,4)
        .padding(.bottom,4)
    }
}
