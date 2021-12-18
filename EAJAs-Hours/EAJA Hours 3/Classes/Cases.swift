//
//  Cases.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/1/21.
//

import Foundation
import RealmSwift

class Cases: Object {
    
    @objc dynamic var _id: ObjectId = ObjectId.generate()
    @objc dynamic var active: Bool = false
    @objc dynamic var court: String? = nil
    @objc dynamic var descriptionX: String? = nil
    @objc dynamic var name: String = ""
    @objc dynamic var organization: String = ""
    @objc dynamic var realm_id: String? = nil
    
    convenience init(active:Bool, court:String?=nil, descriptionX:String?=nil, name:String, organization:String, realm_id:String?=nil){
        self.init()
        self.realm_id = realm_id
        self.active = active
        self.court = court
        self.descriptionX = descriptionX
        self.name = name
        self.organization = organization
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}
