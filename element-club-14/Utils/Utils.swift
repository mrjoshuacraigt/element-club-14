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

struct helpers {
    
    static public func getElementImageFromAction(action: Action) -> String{
        switch action {
        case .agility, .coordination, .stablility, .balance, .flexiblity:
            return "figure.cross.training"
        case .strength, .power, .pull, .push:
            return "dumbbell"
        case .stamina, .speed, .endurance, .acceleration:
            return "figure.run"
        }
                

    }
    
    static public func getSummaryTitleColor(action: Action) -> UIColor {
        switch action {
        case .agility, .coordination, .stablility, .balance, .flexiblity:
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


