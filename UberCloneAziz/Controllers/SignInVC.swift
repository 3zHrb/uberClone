//
//  SignInVC.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 03/09/2020.
//

import Foundation
import UIKit



class SignInVC: UIViewController, UITextFieldDelegate{
    
    var userNameTextFiled: CustomTextFieldView!
    var passwordTextField: CustomTextFieldView!
    var signInButton: CustomButton!
    var signupButton: UIButton!
    var stackViews: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        self.view.backgroundColor = .black
        
        userNameTextFiled = CustomTextFieldView(parentView: self.view)
        userNameTextFiled.customTextView(image: UIImage(named: "ic_account_box_white_2x")! , placeHolder: "Enter User name", securedTextField: false)
        
        
        
        passwordTextField = CustomTextFieldView(parentView: self.view)
        passwordTextField.customTextView(image: UIImage(named: "ic_lock_outline_white_2x")!, placeHolder: "Enter Password", securedTextField: true)
        
        var signInButton = CustomButton()
        signInButton.button(placeHolder: "Sign In", color: .systemBlue)
        
        signupButton = UIButton()
        let atrributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        
        atrributedTitle.append(NSAttributedString(string: "SignUp", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemBlue, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))
        
        signupButton.setAttributedTitle(atrributedTitle, for: .normal)
        
        self.view.addSubview(signupButton)
        
        
        stackViews = UIStackView(arrangedSubviews: [userNameTextFiled, passwordTextField, signInButton])
        stackViews.axis = .vertical
        stackViews.spacing = 20
        
        self.view.addSubview(stackViews)
        
        stackViews.anchors(top: self.view.topAnchor, topPadding: 200)
        stackViews.anhoreXAndY(xAnchore: self.view.centerXAnchor, constant: 0)
        
        
        
//        userNameTextFiled.translatesAutoresizingMaskIntoConstraints = false
//        userNameTextFiled.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
//        user
        
//        userNameTextFiled.anchors(top: self.view.topAnchor, topPadding: 100)
//        userNameTextFiled.anhoreXAndY(xAnchore: self.view.centerXAnchor, constant: 0)
        userNameTextFiled.dimentions(width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.05)
        passwordTextField.dimentions(width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.05)
        signInButton.dimentions(width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.05)
        
        signInButton.setButtonRadius(width: self.view.frame.width * 0.7)
        
        signupButton.anchors( bottom: self.view.bottomAnchor, bottomPadding: 40)
        signupButton.anhoreXAndY(xAnchore: self.view.centerXAnchor, constant: 0)
        signupButton.addTarget(self, action: #selector(signupButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.stackViews.alpha = 1
    }
    
    @objc func signupButtonPressed(){
     
        self.stackViews.alpha = 0
        self.navigationController?.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
}
