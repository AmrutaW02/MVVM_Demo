//
//  UIView+Extension.swift
//  Assignment
//
//  Created by Amruta Warankar on 25/01/22.
//

import Foundation

import UIKit

extension UIView {
    func setCornerRadius(withRadius radii: CGFloat = 5.0) {
        layer.cornerRadius = radii
        layer.masksToBounds = true
    }
    
    func setShadow(clr: UIColor = .darkGray, sRadius: CGFloat = 4.0, cRadius: CGFloat? = nil) {
        self.layer.masksToBounds = false
        self.layer.shadowRadius  = sRadius
        self.layer.shadowColor   = clr.cgColor
        self.layer.shadowOffset  = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 0.3
        self.layer.contentsScale = UIScreen.main.scale
        if let cornerR = cRadius {
            self.layer.cornerRadius = cornerR
        }
    }
    
    func setOpacity(to opacity: Float) {
        self.layer.opacity = opacity
    }
    
    func setBorder(withColor color: UIColor = .clear, borderWidth width: CGFloat = 0, cornerRadius radius: CGFloat) {
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
}
