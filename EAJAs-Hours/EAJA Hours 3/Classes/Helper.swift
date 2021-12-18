//
//  Helper.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/5/21.
//

import Foundation

class Helper{
    
    static func submitReport (firstName:String? = "Isi", lastName:String? = "D", date:Date?, hours:String?, minutes:String?, description:String? = "", cases:Cases?, organization:String?="GLAD") throws {
        
        if firstName == nil{
            throw NSError()
        }
        
        if lastName == nil{
            throw NSError()
        }
        
        if date == nil{
            throw NSError()
        }
        
        if hours == nil{
            throw NSError()
        }
        let hoursDouble = Double(hours!)
        if hoursDouble == nil{
            throw NSError()
        }
        
        if minutes == nil{
            throw NSError()
        }
        let minutesDouble = Double(minutes!)
        if minutesDouble == nil{
            throw NSError()
        }
        
        if cases == nil{
            throw NSError()
        }
        
        if organization == nil{
            throw NSError()
        }
        
        try! Network.realm!.write {
            Network.realm!.add(Reports(caseX: cases!.name, date: date!, descriptionX: description!, first_name: firstName!, last_name: lastName!, hours: Double(round(Double(hoursDouble!+minutesDouble!/60)*100)/100), organization: organization!, realm_id: "12345"))
        }
        
        
    }
    
 
}
