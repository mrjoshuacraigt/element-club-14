//
//  LabelExtention.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/9/23.
//

import Foundation
import UIKit

enum ElementLabelType {
    case title
    case subtitle
}

extension UILabel {
    
    static func elementLabel(title: String, labelType: ElementLabelType) -> UILabel {
        let label = UILabel()
        
        label.text = title
        
        switch labelType {
            case .title:
                label.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
            label.adjustsFontSizeToFitWidth = true
            case .subtitle:
                label.font = UIFont(name: "HelveticaNeue", size: 20)
                label.numberOfLines = 0
            label.textAlignment = .center
        }
        
        return label
    }
    
    
    
}
