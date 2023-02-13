//
//  ButtonExtention.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/8/23.
//

import Foundation
import UIKit

enum ElementButtonType {
    case filled
    case border
}

extension UIButton {
    
    static let BUTTON_HEIGHT: CGFloat = 50
    static let BUTTON_WIDTH: CGFloat = 200
    
    static func elementButton(title: String, color: UIColor?, buttonType: ElementButtonType) -> UIButton {

        let button = UIButton()
        button.layer.cornerRadius = 18
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch buttonType {
        case .filled:
            if color != nil{
                button.backgroundColor = color
            }
        case .border:
                button.backgroundColor = .clear
            button.layer.borderWidth = 2.5
            if color != nil{
                button.layer.borderColor = color?.cgColor
            } else {
                button.layer.borderColor = UIColor.black.cgColor
            }
            
        }

        button.setTitle(title, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    
    
}
