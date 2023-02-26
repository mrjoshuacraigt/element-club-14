//
//  FirebaseEndpoint.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/24/23.
//

import Foundation
import FirebaseDatabase

struct Endpoint {
    var children: [String]
    
}

extension Endpoint {
    
    var databaseReference: DatabaseReference? {
        guard !children.isEmpty else {
            return nil
        }
        
        var ref = Database.database().reference()
        for child in children {
            ref = ref.child(child)
        }
        
        return ref
    }
}


// User Endpoint
extension Endpoint {
    static func user(_ userId: String) -> Self {
        return Endpoint(
                children: ["users", userId]
        )
    }
}

// Summary Endpoint
extension Endpoint {
    static func summary(_ userId: String) -> Self {
        return Endpoint(
                children: ["summary", userId]
        )
    }
}

// Data Endpoint
extension Endpoint {
    static func data(_ userId: String) -> Self {
        return Endpoint(
                children: ["data", userId]
        )
    }
}
