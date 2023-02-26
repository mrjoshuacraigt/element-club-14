//
//  UserModel.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/19/23.
//

import Foundation
import UIKit

struct UserModel: Codable {
    
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    let birthday: String
    let level: String?
    let gym: String?
    let weight: String?
    let units: String?
    
    init(dictionary: NSDictionary) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.firstName = dictionary["firstName"] as? String ?? ""
        self.lastName = dictionary["lastName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.birthday = dictionary["birthday"] as? String ?? ""
        self.level = dictionary["level"] as? String ?? "Water"
        self.gym = dictionary["gym"] as? String ?? "Club 14"
        self.units = dictionary["units"] as? String ?? "imperial"
        self.weight = dictionary["weight"] as? String ?? String(Int.random(in: 10..<75))
    }
    
    func getFullName() -> String{
        return "\(firstName) \(lastName)"
    }
    
    func getAge() -> String {
        return String(Int.random(in: 10..<75))
    }
}
