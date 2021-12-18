//
//  ReportListView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/6/21.
//

import SwiftUI


struct ReportListView: View {
    
    @Binding var searchFilter: String

    func filter(reports:Reports) -> Bool{
        if searchFilter != ""{
            if reports.description.lowercased().contains(searchFilter.lowercased()){
                return true
            }
            else{return false}
        }
        else{return true}
    }
    
    var body: some View {
        List{
            ForEach(Network.getReports().filter{return filter(reports: $0)}, id:\.self) { reports in
                ReportListRowView(reports: reports)
            }
        }
    }
}


