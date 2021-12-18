//
//  MainView.swift
//  EAJA Hours 2
//
//  Created by Isi Donnelly on 7/28/21.
//

import SwiftUI
import RealmSwift

struct MainView: View {
    
    var body: some View {
        TabView{
            
            HomeView()
                .tabItem {
                    Label("Cases", systemImage: "house.fill")
                }
 
            AnalyticsView()
                .tabItem {
                    Label("Analytics", systemImage: "tuningfork")
                }
            WorkView()
                .tabItem {
                    Label("Current Work", systemImage: "aqi.medium")
                }
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "rectangle.fill.on.rectangle.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(.green)
    }
}
