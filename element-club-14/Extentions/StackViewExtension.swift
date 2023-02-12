//
//  StackViewExtension.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/12/23.
//

import Foundation
import UIKit

extension UIStackView {
    
    static func elementStackView(spacing: CGFloat, axis: NSLayoutConstraint.Axis) -> UIStackView {
        
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = spacing
        sv.axis = axis
        
        
        return sv
    }
    
    
}
