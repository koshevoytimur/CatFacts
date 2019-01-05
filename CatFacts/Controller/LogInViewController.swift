//
//  LogInViewController.swift
//  CatFacts
//
//  Created by Тимур Кошевой on 1/4/19.
//  Copyright © 2019 Тимур Кошевой. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    @IBOutlet weak var logInButtonOutlet: UIButton!
    @IBOutlet weak var goToSignUpButtonOutlet: UIButton!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextFieldOutlet.delegate = self
        passwordTextFieldOutlet.delegate = self
        SetUpOutlets()
        
        notifications()
    }
    
    func notifications() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let notifier = NotificationCenter.default
        notifier.addObserver(self,
                             selector: #selector(keyboardWillShowNotification(_:)),
                             name: UIWindow.keyboardWillShowNotification,
                             object: nil)
        notifier.addObserver(self,
                             selector: #selector(keyboardWillHideNotification(_:)),
                             name: UIWindow.keyboardWillHideNotification,
                             object: nil)
    }
    
    //Move view UP when keyboard appears
    @objc func keyboardWillShowNotification(_ notification: NSNotification) {
        moveTextField( -100, up: true)
    }
    
    //Move view DOWN when keyboard gone
    @objc func keyboardWillHideNotification(_ notification: NSNotification) {
        moveTextField( -100, up: false)
    }
    
    //Move view when keyboar appears
    func moveTextField(_ moveDistance: Int, up: Bool) {
        let moveDuration = 0.2
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    // Hide Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //SetUpOutlets
    func SetUpOutlets() {
        emailTextFieldOutlet.layer.cornerRadius = 5
        emailTextFieldOutlet.layer.borderWidth = 0.5
        emailTextFieldOutlet.layer.borderColor = UIColor.gray.cgColor
        emailTextFieldOutlet.textContentType = UITextContentType(rawValue: "")
        
        passwordTextFieldOutlet.layer.cornerRadius = 5
        passwordTextFieldOutlet.layer.borderWidth = 0.5
        passwordTextFieldOutlet.layer.borderColor = UIColor.gray.cgColor
        passwordTextFieldOutlet.isSecureTextEntry = true
        passwordTextFieldOutlet.textContentType = UITextContentType(rawValue: "")
        
        
        logInButtonOutlet.layer.cornerRadius = 5
        logInButtonOutlet.layer.borderWidth = 0.5
        logInButtonOutlet.layer.borderColor = UIColor.gray.cgColor
    }
    
    // MARK: - Actions
    @IBAction func logInButtonAction(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func goToSignUpButtonAction(_ sender: Any) {
        dismissKeyboard()
    }
    
}
