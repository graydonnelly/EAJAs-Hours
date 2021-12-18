//
//  Network.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/23/21.
//

import Foundation
import RealmSwift

class Network{
    
    static let app = App(id: "application-0-auauz")
    static var realm:Realm? = nil
    
    static func login(email:String, password:String) {
        
        let login = app.login(credentials: Credentials.emailPassword(email: email, password: password))
        sleep(2)
        let user = app.currentUser!
        self.realm = try! Realm(configuration: user.configuration(partitionValue: "12345"))
        
    }
    
    static func createAccountAndLogin(firstName:String, lastName:String, email:String, password:String){
        let client = app.emailPasswordAuth
        client.registerUser(email: email, password: password) { (error) in
            guard error == nil else {
                print("Failed to register: \(error!.localizedDescription)")
                return
            }
        }
    }
    
    static func getCases() -> [Cases] {
        let caseArray = self.realm!.objects(Cases.self)
        var caseList = [Cases]()
        for cases in caseArray{
            caseList.append(cases)
        }
        return caseList
    }
    
    static func getReports() -> [Reports] {
        let reportArray = self.realm!.objects(Reports.self)
        var reportList = [Reports]()
        for reports in reportArray{
            reportList.append(reports)
        }
        return reportList
    }
}
