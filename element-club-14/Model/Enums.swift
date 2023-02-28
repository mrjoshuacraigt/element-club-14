//
//  Enums.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/19/23.
//

import Foundation

public enum ElementLevel {
    case Earth
    case Water
    case Wind
    case Fire
}

public enum ElementType: String, CaseIterable {
    
    case agility_1 = "Agility 1"
    case agility_2 = "Agility 2"
    case coordination_1 = "Coordination 1"
    case coordination_2 = "Coordination 2"
    case stability_1 = "Stability 1"
    case stability_2 = "Stability 2"
    case balance = "Balance"
    case flexiblity = "Flexiblity"
    case strength = "Strength"
    case acceleration = "Acceleration"
    case power = "Power"
    case pull = "Pull"
    case push = "Push"
    case speed = "Speed"
    case stamina = "Stamina"
    case endurance = "Endurance"
}
