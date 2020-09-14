//
//  UIView.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 03/09/2020.
//

import Foundation
import UIKit

extension UIView{
    
    
    func anchors(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topPadding: CGFloat = 0, leftPadding: CGFloat = 0, bottomPadding: CGFloat = 0, rightPadding: CGFloat = 0){
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        
    }
    
    func anhoreXAndY(yAnchore: NSLayoutYAxisAnchor? = nil, xAnchore: NSLayoutXAxisAnchor? = nil, constant: CGFloat = 0){
     
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let yAnchore = yAnchore {
            self.centerYAnchor.constraint(equalTo: yAnchore, constant: constant).isActive = true
        }
        
        if let xAnchore = xAnchore {
            self.centerXAnchor.constraint(equalTo: xAnchore, constant: constant).isActive = true
        }
        
    }
    
    func dimentions(width: CGFloat? = nil, height: CGFloat? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width{
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    
}
