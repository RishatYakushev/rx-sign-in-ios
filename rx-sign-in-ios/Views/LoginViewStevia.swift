//
//  LoginViewStevia.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import UIKit
import Stevia

class LoginViewStevia: UIView {

    // MARK: - Nested Types

     fileprivate enum Constants {

         // MARK: - Nested Properties

         static let navigationBarTitle = "Authorization"
         static let mailLabelTitle = "Mail"
         static let passwordLabelTitle = "Password"
         static let forgotButtonTitle = "Forgot your password?"
         static let signInButtonTitle = "Sign in"
         static let createAccountButtonTitle = "I don't have an account yet. Create"

         static let mailTextFieldPlaceholder = "anykee@mail.ru"
         static let passwordTextFieldPlaceholder = "*********"

         static let signInButtonCornerRadius: CGFloat = 22
         static let forgotPasswordButtonCornerRadius: CGFloat = 4

         static let forgotPasswordButtonBorderWidth: CGFloat = 1
     }
    
    // MARK: - Initializers
    
    convenience init() {
         self.init(frame:CGRect.zero)
         
         self.setupViews()

         self.setupConstraints()
     }
    
    // MARK: - Instance Properties

      public lazy var scrollView: UIScrollView = with(.init()) {
          $0.backgroundColor = Colors.white
      }

      public lazy var contentView: UIView = with(.init()) {
          $0.backgroundColor = Colors.white
      }

      public lazy var mailLabel: UILabel = with(.init()) {
          $0.textColor = Colors.warmGray
          $0.text = Constants.mailLabelTitle
          $0.font = UIFont.systemFont(ofSize: 13)
          $0.textAlignment = .left
      }

      public lazy var mailTextField: UITextField = with(.init()) {
          $0.font = UIFont.systemFont(ofSize: 16)
          $0.borderStyle = .none
          $0.backgroundColor = Colors.clearColor
          $0.placeholder = Constants.mailTextFieldPlaceholder
      }

      public lazy var separatorView: UIView = with(.init()) {
          $0.backgroundColor = Colors.warmGray
      }

      public lazy var passwordLabel: UILabel = with(.init()) {
          $0.textColor = Colors.warmGray
          $0.text = Constants.passwordLabelTitle
          $0.font = UIFont.systemFont(ofSize: 13)
          $0.textAlignment = .left
      }

      public lazy var passwordTextField: UITextField = with(.init()) {
          $0.font = UIFont.systemFont(ofSize: 16)
          $0.isSecureTextEntry = true
          $0.borderStyle = .none
          $0.backgroundColor = Colors.clearColor
          $0.placeholder = Constants.passwordTextFieldPlaceholder
      }

      public lazy var passwordSeparatorView: UIView = with(.init()) {
          $0.backgroundColor = Colors.warmGray
      }

      public lazy var forgotPasswordButton: UIButton = with(.init()) {
          $0.setTitle(Constants.forgotButtonTitle, for: .normal)
          $0.setTitleColor(Colors.warmGray, for: .normal)
          $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
          $0.backgroundColor = Colors.clearColor
          $0.layer.cornerRadius = Constants.forgotPasswordButtonCornerRadius
          $0.layer.borderWidth = Constants.forgotPasswordButtonBorderWidth
          $0.layer.borderColor = Colors.veryLightPink.cgColor
      }

      public lazy var signInButton: PrimaryButton = with(.init()) {
          $0.setTitleColor(Colors.white, for: .normal)
          $0.setTitle(Constants.signInButtonTitle, for: .normal)
          $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
          $0.layer.cornerRadius = Constants.signInButtonCornerRadius
      }

      public lazy var createAccountButton: UIButton = with(.init()) {
          $0.setTitleColor(Colors.windowsBlue, for: .normal)
          $0.setTitle(Constants.createAccountButtonTitle, for: .normal)
          $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
      }
   
    // MARK: - Instance Methods

    private func setupViews() {
        self.sv(scrollView)
        self.scrollView.sv(self.contentView)
        self.contentView.sv(self.mailLabel, self.mailTextField, self.separatorView, self.passwordLabel, self.passwordTextField, self.passwordSeparatorView, self.forgotPasswordButton, self.signInButton, self.createAccountButton)
    }
    
    private func setupConstraints() {
        self.scrollView.fillContainer()
        self.contentView.fillContainer()
        self.contentView.centerInContainer()
        
        self.mailLabel.Left == Left + 15
        self.mailLabel.Right == Right - 116
        self.mailLabel.Top == Top + 146

        self.mailTextField.Left == Left + 15
        self.mailTextField.Right == Right - 16
        self.mailTextField.Top == self.mailLabel.Bottom + 2
        self.mailTextField.Height == 19
        
        self.separatorView.Left == Left + 15
        self.separatorView.Right == Right - 16
        self.separatorView.Top == self.mailTextField.Bottom + 4
        self.separatorView.Height == 0.5
        
        self.passwordLabel.Left == Left + 15
        self.passwordLabel.Right == Right - 116
        self.passwordLabel.Top == self.separatorView.Top + 12

        self.passwordTextField.Left == Left + 15
        self.passwordTextField.Right == self.forgotPasswordButton.Right - 16
        self.passwordTextField.Top == self.passwordLabel.Bottom + 2
        self.passwordTextField.Height == 19
        
        self.forgotPasswordButton.Right == Right - 16
        self.forgotPasswordButton.Top == self.separatorView.Bottom + 14
        self.forgotPasswordButton.Height == 30
        self.forgotPasswordButton.Width == 162

        self.passwordSeparatorView.Left == Left + 15
        self.passwordSeparatorView.Right == Right - 16
        self.passwordSeparatorView.Top == self.passwordTextField.Bottom + 4
        self.passwordSeparatorView.Height == 0.5
        
        self.signInButton.Top == self.passwordSeparatorView.Bottom + 34
        self.signInButton.CenterX == self.contentView.CenterX
        self.signInButton.Width == 147
        self.signInButton.Height == 44
        
        self.createAccountButton.Top == self.signInButton.Bottom + 16
        self.createAccountButton.Left == Left + 16
        self.createAccountButton.Right == Right - 16
        self.createAccountButton.CenterX == self.contentView.CenterX
    }
}
