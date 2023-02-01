//
//  UserDBHelper.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/28/23.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth


struct UserDbHelper {
    
    private static let database = Database.database().reference()
    
    static func getUserData() {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Usering not found")
            return
        }

        database.child("users").child(uid).observeSingleEvent(of: .value, with: { snapshot in
          // Get user value
          let value = snapshot.value as? NSDictionary
          let username = value?["email"] as? String ?? ""
            print(username)
          // ...
        }) { error in
          print(error.localizedDescription)
        }
        
        
    }
    
    static func addNewUser(uid: String, email: String, displayName: String?) {
        
        let object: [String: Any] = [
            "uid": uid,
            "name": displayName ?? "",
            "email": email,
            "weight": "nil",
            "age": String(Int.random(in: 18..<75)),
            "units": "metric"
        ]
        
        //save user to db
        database.child("users/\(uid)").setValue(object)
    }

    
    public static func updatedUserFirstName(name: String) {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Usering not found")
            return
        }

        database.updateChildValues(["users/\(uid)/name": name])

        
    }
    
    static func updateUserLastName(lastName: String) {
        
    }
    
    static func updateUserWeight (weight: String){
        
    }
    
    
}
