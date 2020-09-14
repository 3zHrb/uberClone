//
//  SignUpVC.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 12/09/2020.
//

import Foundation
import UIKit

class SignUpVC: UIViewController{
    
    var emailTextField: CustomTextFieldView!
    var userNameTextField: CustomTextFieldView!
    var passwordTextField: CustomTextFieldView!
    var signupButton: CustomButton!
    var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emailTextField = CustomTextFieldView(parentView: self.view)
        emailTextField.customTextView(image: UIImage(named: "ic_mail_outline_white_2x")!, placeHolder: "Enter your email", securedTextField: false)
        
        userNameTextField = CustomTextFieldView(parentView: self.view)
        userNameTextField.customTextView(image: UIImage(named: "ic_account_box_white_2x")! , placeHolder: "Enter User name", securedTextField: false)
        
        
        passwordTextField = CustomTextFieldView(parentView: self.view)
        passwordTextField.customTextView(image: UIImage(named: "ic_lock_outline_white_2x")!, placeHolder: "Enter Password", securedTextField: true)
        
        signupButton = CustomButton()
        signupButton.button(placeHolder: "Sign Up", color: .systemBlue)
        signupButton.addTarget(self, action: #selector(signupButtonIspressed), for: .touchUpInside)
        
        var stack = UIStackView(arrangedSubviews: [emailTextField, userNameTextField, passwordTextField, signupButton])
        
        stack.axis = .vertical
        stack.spacing = 20
        
        self.view.addSubview(stack)
        
        stack.anchors(top: self.view.topAnchor, topPadding: 200)
        stack.anhoreXAndY(xAnchore: self.view.centerXAnchor, constant: 0)
        
        emailTextField.dimentions(width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.05)
        userNameTextField.dimentions(width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.05)
        passwordTextField.dimentions(width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.05)
        signupButton.dimentions(width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.05)
        signupButton.setButtonRadius(width: self.view.frame.width * 0.7)
        
        
    }
    
    @objc func signupButtonIspressed(){
        
        self.navigationController?.pushViewController(HomeScreen(), animated: true)
        
    }
    
    
    
}
