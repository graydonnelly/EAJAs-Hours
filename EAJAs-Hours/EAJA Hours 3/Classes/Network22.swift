//
//  Network22.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/6/21.
//

import Foundation
import RealmSwift

class Network22{
    
    static let app = App(id: "application-0-auauz")
    //static let creds = Credentials.anonymous
    static let login = app.login(credentials: Credentials.emailPassword(email: "x@gmail.com", password: "123456"))
    //static let login = app.login(credentials: creds)
    //guard static let user = app.currentUser else {fatalError("FFFFFFFF")}
    static let user = app.currentUser!
    static let realm = try! Realm(configuration: user.configuration(partitionValue: "12345"))
    let client = app.emailPasswordAuth
    
    static var caseArray = realm.objects(Cases.self)
    static var caseList:[Cases] = []
    
    static var reportArray = realm.objects(Reports.self)
    static var reportList:[Reports] = []
    
    static func update(){
        self.caseArray = self.realm.objects(Cases.self)
        self.reportArray = self.realm.objects(Reports.self)
        self.caseList = []
        self.reportList = []
        
        for cases in self.caseArray{
            self.caseList.append(cases)
        }
        
        for reports in self.reportArray{
            self.reportList.append(reports)
        }
        
        
    }
    
    
}
