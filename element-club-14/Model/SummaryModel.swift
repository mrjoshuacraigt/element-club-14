//
//  SummaryModel.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/25/23.
//

import Foundation

struct SummaryModel {
    
    let uid: String
    let exercise: String
    let perf: String
    let unit: String
    let dateTime: String
    //TODO change back to Action
//    let action: Action
    let action: String

    
    init(dictionary: NSDictionary) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.exercise = dictionary["exercise"] as? String ?? ""
        self.perf = dictionary["perf"] as? String ?? ""
        self.unit = dictionary["unit"] as? String ?? ""
        self.dateTime = dictionary["dateTime"] as? String ?? ""
        self.action = dictionary["exercise"] as? String ?? ""
    }
    
    init(uid: String, exercise: String) {
        self.uid = uid
        self.exercise = exercise
        self.perf = "No Exercise Tracked"
        self.unit = ""
        self.dateTime = "empty"
        self.action = exercise
    }
    
    func getDateTime() -> String {
        if (self.dateTime.elementsEqual("empty")) {
            return ""
        }
        
        return Date.getSummaryDateTime(dateTimeFrom1907: self.dateTime)
    }
}

