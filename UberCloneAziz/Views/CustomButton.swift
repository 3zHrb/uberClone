//
//  CustomButton.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 11/09/2020.
//

import Foundation
import UIKit

class CustomButton: UIButton{
    

    
    func button(placeHolder: String, color: UIColor){
        
        
        self.backgroundColor = color
        self.setTitle(placeHolder, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.layer.opacity = 0.84
        
    }
    
    func setButtonRadius(width: CGFloat){
        
        self.layer.cornerRadius = width / 25
        
    }
    
    
}
