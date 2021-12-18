//
//  ReportListRowView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/6/21.
//

import SwiftUI

struct ReportListRowView: View {
    
    var reports: Reports
    let dateFormatter = DateFormatter()
    
    init(reports:Reports){
        self.reports = reports
        dateFormatter.dateFormat = "MMM d, YYYY, h:mm"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
    }
    
    var body: some View {
        
        
        NavigationLink(destination: ReportView(reports: reports)){
            VStack(alignment:.leading) {
                Text(dateFormatter.string(from: reports.date))
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text(reports.caseX)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
        }
        
    }
}
