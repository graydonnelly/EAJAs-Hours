//
//  Reports.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/1/21.
//

import Foundation
import RealmSwift

class Reports: Object {
    @objc dynamic var _id: ObjectId = ObjectId.generate()
    @objc dynamic var caseX: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var descriptionX: String = ""
    @objc dynamic var first_name: String = ""
    @objc dynamic var hours: Double = 0
    @objc dynamic var last_name: String = ""
    @objc dynamic var organization: String = ""
    @objc dynamic var realm_id: String? = nil
    
    convenience init(caseX:String, date:Date, descriptionX:String, first_name:String, last_name:String, hours:Double, organization:String, realm_id:String?=nil){
        self.init()
        self.caseX = caseX
        self.date = date
        self.descriptionX = descriptionX
        self.first_name = first_name
        self.last_name = last_name
        self.hours = hours
        self.organization = organization
        self.realm_id = realm_id
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}
