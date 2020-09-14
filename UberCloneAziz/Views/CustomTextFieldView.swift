//
//  CusyomTextFieldView.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 03/09/2020.
//

import Foundation
import UIKit

protocol CustomTextFieldViewDelegate{
    func didReturn()
}

class CustomTextFieldView: UIView, UITextFieldDelegate{
    
    var parentView: UIView
    
    var delegateVC: UIViewController?
    
    init(parentView: UIView){
       
        self.parentView = parentView
        super.init(frame: CGRect())
                
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textField1: UITextField {
        return UITextField()
    }
    
    func customTextView(image: UIImage, placeHolder: String, securedTextField: Bool){
        print("we are inside customTextView")
        
        self.backgroundColor = .none
        self.layer.borderColor = CGColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1)
        self.layer.cornerRadius = self.frame.width / 2
        
        
        let imageView = UIImageView(image: image)
        imageView.layer.shadowColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.layer.shadowRadius = 15
        imageView.layer.shadowOpacity = 0.5
        
        var textField = self.textField1
        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        let viewSpaceForTextField = UIView()
        viewSpaceForTextField.backgroundColor = .none
        viewSpaceForTextField.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        textField.leftView = viewSpaceForTextField
        textField.leftViewMode = .always
   
        
        textField.backgroundColor = .black
        textField.layer.cornerRadius = 5
 
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .lightGray
        
        if securedTextField {
            textField.textContentType = .password
        }
        
        self.addSubview(imageView)
        self.addSubview(textField)
        self.addSubview(bottomLine)
        
        imageView.anchors(top: self.topAnchor, left: self.leftAnchor, leftPadding: 5)
        imageView.dimentions(width: self.parentView.frame.width * 0.09, height: self.parentView.frame.height * 0.03)
        textField.anchors(top: self.topAnchor, left: imageView.rightAnchor, right: self.rightAnchor, topPadding: 5, leftPadding: 10, bottomPadding: 5, rightPadding: 5)
        textField.anhoreXAndY(yAnchore: imageView.centerYAnchor)
        bottomLine.anchors(top: imageView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 5, leftPadding: 10, bottomPadding: 5, rightPadding: 5)
        bottomLine.dimentions(height: 1)
        bottomLine.layer.cornerRadius = 2
        
//        viewSpaceForTextField.anchors(left: textField.leftAnchor, rightPadding: 10)
//        viewSpaceForTextField.dimentions(width: 10, height: 30)
        
        self.layer.opacity = 1
        
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("return key is pressed")
//
//
//
//        textField.resignFirstResponder()
//        return true
//    }
    
}
