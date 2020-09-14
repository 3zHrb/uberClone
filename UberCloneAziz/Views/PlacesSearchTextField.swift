//
//  PlacesSearchTextField.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 12/09/2020.
//

import Foundation
import UIKit

protocol GestureDelegate: UIViewController{
    
    func userDidTouchTheSearchbar()
}

class PlacesScearchTextField: UITextField{
    
    var delegateVC: GestureDelegate
    var gesture: UITapGestureRecognizer!
    
    init(delegateVC: GestureDelegate){
        self.delegateVC = delegateVC
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    
    
    func createScreachViewWithSpecifications(){
        
        var spaceView = UIView()
      
        self.anchors(top: self.delegateVC.view.topAnchor, topPadding: 120)
        self.dimentions(width: self.delegateVC.view.frame.width * 0.7, height: self.delegateVC.view.frame.height * 0.05)
        self.anhoreXAndY(xAnchore: self.delegateVC.view.centerXAnchor, constant: 0)
        self.attributedPlaceholder = NSAttributedString(string: "Enter a place", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.5
        self.backgroundColor = .white
        self.layer.borderWidth = 2
        self.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.1)
        spaceView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        self.leftView = spaceView
        self.leftViewMode = .always
        
        gesture = UITapGestureRecognizer(target: self, action: #selector(gestureTriggered))
        gesture.numberOfTouchesRequired = 1
        
        self.addGestureRecognizer(gesture)
        
//        spaceView.anchors(left: self.leftAnchor, rightPadding: 10)
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func gestureTriggered(){
        delegateVC.userDidTouchTheSearchbar()
    }
    
}
