//
//  TextFieldExtension.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/12/23.
//

import Foundation
import UIKit

extension UITextField {
    
    static func elementTextField(placerholder: String, isSecureText: Bool = false) -> UITextField {
        
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 8
        tf.isSecureTextEntry = isSecureText
        tf.attributedPlaceholder = NSAttributedString(string: placerholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        return tf
    }
    
    
    
    
}
