//
//  CustomCell.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 24/09/2020.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell{
    
    
    var buildingName: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "Butilding Name"
        label.textColor = .black
        return label
    }()
    
    var buildingAddress: UILabel = {
            var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        label.text = "Street Name"
        return label
        }()
    
    init(){
        
        super.init(style: .default, reuseIdentifier: nil)
        
        var stack = UIStackView(arrangedSubviews: [buildingName, buildingAddress])
        stack.axis = .vertical
        stack.distribution = .equalCentering
        self.addSubview(stack)
        
        stack.anhoreXAndY(yAnchore: self.centerYAnchor)
        stack.anchors(left: self.leftAnchor, leftPadding: 15)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
