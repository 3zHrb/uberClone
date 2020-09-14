//
//  SourceAndDestinationView.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 13/09/2020.
//

import Foundation
import UIKit


class SourceAndDestinationView: UIView{
    
    var delegateVC: GestureDelegate
    var currentUserNameLabel: UILabel!
    var backButton: UIButton!
    var sourceTextField: UITextField!
    var destinationTextField: UITextField!
    var sourceView: UIView!
    var destinationView: UIView!
    var line: UIView!
    
    init(delegateVC: GestureDelegate){
        self.delegateVC = delegateVC
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpSourceAndDestinationView(){
        
        self.currentUserNameLabel = UILabel()
        self.currentUserNameLabel.tintColor = .lightGray
        self.currentUserNameLabel.font = UIFont.systemFont(ofSize: 20)
        
        self.backButton = UIButton()
        self.backButton.setImage(UIImage(named: "baseline_arrow_back_black_36dp"), for: .normal)
        
        self.sourceTextField = UITextField()
        self.sourceTextField.attributedPlaceholder = NSAttributedString(string: "Your Location", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        self.destinationTextField = UITextField()
        self.destinationTextField.attributedPlaceholder = NSAttributedString(string: "Your Destination", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        self.sourceView = UIView()
        self.sourceView.backgroundColor = .lightGray
        self.sourceView.frame.size = CGSize(width: 10, height: 10)
        self.sourceView.layer.cornerRadius = self.sourceView.frame.width / 2
        
        self.destinationView = UIView()
        self.destinationView.backgroundColor = .gray
        self.destinationView.frame.size = CGSize(width: 10, height: 10)
        self.destinationView.layer.cornerRadius = self.sourceView.frame.width / 2
        
        self.line = UIView()
        self.line.backgroundColor = .gray
        
        var spaceView = UIView()
        spaceView.frame.size = CGSize(width: 10, height: 10)
        
        self.sourceTextField.leftView = spaceView
        self.sourceTextField.leftViewMode = .always
        
        self.destinationTextField.leftView = spaceView
        self.destinationTextField.leftViewMode = .always
        
        self.anchors(top: self.delegateVC.view.topAnchor, left: self.delegateVC.view.leftAnchor, right: self.delegateVC.view.rightAnchor, topPadding: 120, leftPadding: 0, bottomPadding: 0, rightPadding: 0)
        
        self.addSubview(currentUserNameLabel)
        self.addSubview(backButton)
        self.addSubview(sourceTextField)
        self.addSubview(destinationTextField)
        self.addSubview(sourceView)
        self.addSubview(destinationView)
        self.addSubview(line)
        
        self.currentUserNameLabel.anchors(top: self.topAnchor, topPadding: 20)
        self.currentUserNameLabel.anhoreXAndY(xAnchore: self.centerXAnchor, constant: 0)
        
        self.backButton.anchors(top: self.topAnchor, left: self.leftAnchor,topPadding: 20, leftPadding: 20)
       
        
        self.sourceTextField.anchors(top: self.currentUserNameLabel.bottomAnchor, topPadding: 10)
        self.sourceTextField.dimentions(width: self.frame.width * 0.7, height: self.frame.height * 0.2)
        
        self.destinationTextField.anchors(top: self.sourceTextField.bottomAnchor,topPadding: 20)
        self.destinationTextField.dimentions(width: self.frame.width * 0.7, height: self.frame.height * 0.2)
        
        self.sourceView.anchors(right: self.sourceTextField.leftAnchor, rightPadding: 10)
        self.sourceView.anhoreXAndY(yAnchore: self.sourceTextField.centerYAnchor)
        
        self.line.anchors(top: self.sourceView.bottomAnchor, bottom: self.destinationView.topAnchor)
        self.line.anhoreXAndY(xAnchore: self.sourceView.centerXAnchor, constant: 0)
        
        self.destinationView.anchors(right: self.destinationTextField.leftAnchor, rightPadding: 10)
        self.destinationView.anhoreXAndY(yAnchore: self.destinationTextField.centerYAnchor)
        
        
        
        
    }
    
    
    
    
}
