//
//  UserDBHelper.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/28/23.
//

import Foundation
import FirebaseDatabase


class UserDbHelper {
    
    private static let database = Database.database().reference()
    
    static func addNewUser(uid: String, email: String, displayName: String?) {
        
        let object: [String: Any] = [
            "uid": uid,
            "name": displayName ?? "",
            "email": email,
            "weight": "nil",
            "units": "metric"
        ]
        
        //save user to db
        database.child("users/\(uid)").setValue(object)
    }

    
    static func updatedUserFirstName() {
        
    }
    
    static func updateUserLastName(lastName: String) {
        
    }
    
    static func updateUserWeight (weight: String){
        
    }
    
    
}
