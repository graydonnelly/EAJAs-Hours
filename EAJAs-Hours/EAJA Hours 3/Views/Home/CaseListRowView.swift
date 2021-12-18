//
//  CaseListRowView.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/2/21.
//

import SwiftUI

struct CaseListRowView: View {
    
    var cases: Cases
    
    var body: some View {
        
        NavigationLink(destination: CaseView(cases: cases)){
            VStack(alignment:.leading) {
                Text(cases.name)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text(cases.descriptionX ?? "")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
        }
        
    }
}
