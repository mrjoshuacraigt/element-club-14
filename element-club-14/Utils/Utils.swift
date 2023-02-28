//
//  Utils.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/30/23.
//

import Foundation
import UIKit

enum Action {

    case agility
    case coordination
    case stablility
    case balance
    case strength
    case acceleration
    case power
    case pull
    case push
    case speed
    case stamina
    case endurance
    case flexiblity
}

enum ElementUnits: String {
    case imperial = "Imperial"
    case metric = "Metric"
}

struct helpers {
    
    static let CONTAINER_STACK_SPACING = 4.0
    
    static let INTERNAL_STACK_SPACING = 2.0
    
    static public func getElementImageFromAction(exercise: ElementType?) -> String {
        
        guard let exercise = exercise else {
            return ""
        }
        
        switch exercise {
        case .agility_1, .agility_2, .coordination_1, .coordination_2, .stability_1, .stability_2,
                .balance, .flexiblity:
            return "figure.cross.training"
        case .strength, .power, .pull, .push:
            return "dumbbell"
        case .stamina, .speed, .endurance, .acceleration:
            return "figure.run"
        }
                

    }
    
    static public func getSummaryTitleColor(exercise: ElementType?) -> UIColor {
        
        guard let exercise = exercise else {
            return UIColor.clear
        }

        switch exercise {
        case .agility_1, .agility_2, .coordination_1, .coordination_2, .stability_1, .stability_2,
                .balance, .flexiblity:
            return UIColor.systemPink
        case .strength, .power, .pull, .push:
            return UIColor.systemPurple
        case .stamina, .speed, .endurance, .acceleration:
            return UIColor.systemOrange
        }
        
    }
    
    static public func getSummaryData() -> String {
        
        return "Lorem ipsum odor amet. Kramer: Hey! Happy Festivus, everyone! Kramer: Hey! Happy Festivus, everyone! Elaine: No, I don't have a square to spare. I can't spare a square. Elaine: No, I don't have a square to spare. I can't spare a square. Kramer: Hey! Happy Festivus, everyone! Yada, yada, yada..."
        
    }
    
    
    
    
}


