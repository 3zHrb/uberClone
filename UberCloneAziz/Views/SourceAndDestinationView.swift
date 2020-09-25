//
//  SourceAndDestinationView.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 13/09/2020.
//

import Foundation
import UIKit


protocol BackButtonDelegate: UIViewController{
    
    func backButtonFromSourceAndDestinationViewIsPressed()
    
}

class SourceAndDestinationView: UIView{
    
    var delegateVC: BackButtonDelegate
    var currentUserNameLabel: UILabel!
    var backButton: UIButton!
    var sourceTextField: UITextField!
    var destinationTextField: UITextField!
    var sourceView: UIView!
    var destinationView: UIView!
    var line: UIView!
    
    init(delegateVC: BackButtonDelegate){
        self.delegateVC = delegateVC
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.25
//        self.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpSourceAndDestinationView(){
        
        self.currentUserNameLabel = UILabel()
        self.currentUserNameLabel.textColor = .lightGray
        self.currentUserNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.currentUserNameLabel.text = "User Name"

        self.backButton = UIButton()
        self.backButton.setImage(UIImage(named: "baseline_arrow_back_black_36dp"), for: .normal)
        self.backButton.addTarget(self, action: #selector(backButtonIsPressed), for: .touchUpInside)
        self.backButton.layer.shadowColor = UIColor.black.cgColor
        self.backButton.layer.shadowOpacity = 0.25
        self.backButton.layer.shadowRadius = 5
        
        
    
        self.sourceTextField = UITextField()
        self.sourceTextField.attributedPlaceholder = NSAttributedString(string: "Your Location", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray.withAlphaComponent(0.5)])
        self.sourceTextField.backgroundColor = UIColor(red: 238/255, green: 235/255, blue: 240/255, alpha: 1)
        
        
       

        self.destinationTextField = UITextField()
        self.destinationTextField.attributedPlaceholder = NSAttributedString(string: "Your Destination", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.destinationTextField.backgroundColor = UIColor(red: 211/255, green: 208/255, blue: 212/255, alpha: 1)
        self.destinationTextField.becomeFirstResponder()
        
       

        self.sourceView = UIView()
        self.sourceView.backgroundColor = .lightGray
        self.sourceView.layer.opacity = 0.5
//        self.sourceView.frame.size = CGSize(width: 10, height: 10)
//        self.sourceView.layer.cornerRadius = self.sourceView.frame.width / 2

        self.destinationView = UIView()
        self.destinationView.backgroundColor = .black
//        self.destinationView.frame.size = CGSize(width: 10, height: 10)
//        self.destinationView.layer.cornerRadius = self.sourceView.frame.width / 2

        self.line = UIView()
        self.line.backgroundColor = .gray
        self.line.layer.opacity = 0.5

        var spaceViewForSourceTextfiled = UIView()
        spaceViewForSourceTextfiled.frame.size = CGSize(width: 10, height: 10)

        self.sourceTextField.leftView = spaceViewForSourceTextfiled
        self.sourceTextField.leftViewMode = .always

        
        var spaceViewForDestinationTextfiled = UIView()
        spaceViewForDestinationTextfiled.frame.size = CGSize(width: 10, height: 10)
        
        self.destinationTextField.leftView = spaceViewForDestinationTextfiled
        self.destinationTextField.leftViewMode = .always

//        self.anchors(top: self.delegateVC.view.topAnchor, left: self.delegateVC.view.leftAnchor, right: self.delegateVC.view.rightAnchor, leftPadding: 0, bottomPadding: 0, rightPadding: 0)

        self.backgroundColor = .white
        
        self.addSubview(currentUserNameLabel)
        self.addSubview(backButton)
        self.addSubview(sourceTextField)
        self.addSubview(destinationTextField)
        self.addSubview(sourceView)
        self.addSubview(destinationView)
        self.addSubview(line)

        self.currentUserNameLabel.anchors(top: self.topAnchor, topPadding: 10)
        self.currentUserNameLabel.anhoreXAndY(xAnchore: self.centerXAnchor, constant: 0)

        self.backButton.anchors(top: self.topAnchor, left: self.leftAnchor,topPadding: 10, leftPadding: 10)
        backButton.dimentions(width: 30, height: 30)
        backButton.anhoreXAndY(yAnchore: self.currentUserNameLabel.centerYAnchor, constant: 0)
        
        self.sourceTextField.anchors(top: self.backButton.bottomAnchor, right: self.rightAnchor, topPadding: 10, rightPadding: 30)
        self.sourceTextField.anhoreXAndY(xAnchore: self.centerXAnchor, constant: 0)
        self.sourceTextField.dimentions(height: 30)
        
        self.destinationTextField.anchors(top: sourceTextField.bottomAnchor, right: self.rightAnchor, topPadding: 10, rightPadding: 30)
        self.destinationTextField.anhoreXAndY(xAnchore: self.centerXAnchor, constant: 0)
        self.destinationTextField.dimentions(height: 30)
        
        


        
        

        self.sourceView.anchors(right: self.sourceTextField.leftAnchor, rightPadding: 10)
        self.sourceView.anhoreXAndY(yAnchore: self.sourceTextField.centerYAnchor)
        
        self.line.anchors(top: self.sourceView.bottomAnchor, bottom: self.destinationView.topAnchor, topPadding: 1, bottomPadding: 1)
        self.line.anhoreXAndY(xAnchore: self.sourceView.centerXAnchor, constant: 0)
        self.line.dimentions(width: 1)

        self.destinationView.anchors(right: self.destinationTextField.leftAnchor, rightPadding: 10)
        self.destinationView.anhoreXAndY(yAnchore: self.destinationTextField.centerYAnchor)

        sourceView.dimentions(width: 10, height: 10)
        self.sourceView.layer.cornerRadius = 5

        destinationView.dimentions(width: 10, height: 10)
////        spaceView.dimentions(width: 10, height: 10)
        
    }
    
    @objc func backButtonIsPressed(){
        self.delegateVC.backButtonFromSourceAndDestinationViewIsPressed()
    }
    
    
    
    
}
