//
//  CaseListView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/2/21.
//

import SwiftUI

struct CaseListView: View {
    
    @Binding var searchFilter: String
    
    func filter(cases:Cases) -> Bool{
        if searchFilter != ""{
            if cases.name.lowercased().contains(searchFilter.lowercased()) || (cases.descriptionX ?? "").lowercased().contains(searchFilter.lowercased()){
                return true
            }
            else{return false}
        }
        else{return true}
    }
    
    
    var body: some View {
      
        List{
            ForEach(Network.getCases().filter{return filter(cases: $0)}, id:\.self) { cases in
                CaseListRowView(cases: cases)
            }
        }
      
    }
    
}
