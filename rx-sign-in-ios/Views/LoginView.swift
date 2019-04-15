//
//  LoginView.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class SignInView: UIView {
    
    // MARK: - Nested Types
    
    fileprivate enum Constants {
        
        // MARK: - Nested Properties
        
        static let navigationBarTitle = "Authorization".localized()
        static let mailLabelTitle = "Mail".localized()
        static let passwordLabelTitle = "Password".localized()
        static let forgotButtonTitle = "Forgot your password?".localized()
        static let signInButtonTitle = "Sign in".localized()
        static let createAccountButtonTitle = "I don't have an account yet. Create".localized()
        
        static let mailTextFieldPlaceholder = "anykee@mail.ru"
        static let passwordTextFieldPlaceholder = "*********"
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupViews()
        
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Instance Properties
    
    public lazy var scrollView: UIScrollView = with(.init()) {
        $0.backgroundColor = UIColor.white
    }
    
    public lazy var contentView: UIView = with(.init()) {
        $0.backgroundColor = UIColor.white
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
        $0.backgroundColor = UIColor.clear
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
        $0.numberOfLines = 0
    }
    
    public lazy var passwordTextField: UITextField = with(.init()) {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.isSecureTextEntry = true
        $0.borderStyle = .none
        $0.backgroundColor = UIColor.clear
        $0.placeholder = Constants.passwordTextFieldPlaceholder
    }
    
    public lazy var passwordSeparatorView: UIView = with(.init()) {
        $0.backgroundColor = Colors.warmGray
    }
    
    public lazy var forgotPasswordButton: UIButton = with(.init()) {
        $0.setTitle(Constants.forgotButtonTitle, for: .normal)
        $0.setTitleColor(Colors.warmGray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = Colors.veryLightPink.cgColor
    }
    
    public lazy var signInButton: PrimaryButton = with(.init()) {
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.setTitle(Constants.signInButtonTitle, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.layer.cornerRadius = 22
    }
    
    public lazy var createAccountButton: UIButton = with(.init()) {
        $0.setTitleColor(Colors.windowsBlue, for: .normal)
        $0.setTitle(Constants.createAccountButtonTitle, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
    
    // MARK: - Instance Methods
        
    private func setupViews() {
        self.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.mailLabel)
        self.contentView.addSubview(self.mailTextField)
        self.contentView.addSubview(self.separatorView)
        self.contentView.addSubview(self.passwordLabel)
        self.contentView.addSubview(self.passwordTextField)
        self.contentView.addSubview(self.passwordSeparatorView)
        self.contentView.addSubview(self.forgotPasswordButton)
        self.contentView.addSubview(self.signInButton)
        self.contentView.addSubview(self.createAccountButton)
    }
    
    private func setupConstraints() {
        self.scrollView.snp.makeConstraints {
            $0.edges.equalTo(snp.edges)
        }
        
        self.contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.snp.edges)
            $0.center.equalTo(scrollView.snp.center)
        }
        
        self.mailLabel.snp.makeConstraints {
            $0.left.equalTo(self.contentView).inset(15)
            $0.right.equalTo(self.contentView).inset(116)
            $0.top.equalTo(self.contentView).inset(146)
        }
        
        self.mailTextField.snp.makeConstraints {
            $0.left.equalTo(self.contentView).inset(15)
            $0.right.equalTo(self.contentView).inset(116)
            $0.top.equalTo(self.mailLabel).offset(16)
            $0.height.equalTo(19)
        }
        
        self.separatorView.snp.makeConstraints {
            $0.left.equalTo(self.contentView).inset(15)
            $0.right.equalTo(self.contentView).inset(16)
            $0.top.equalTo(self.mailTextField).inset(21)
            $0.height.equalTo(0.5)
        }
        
        self.passwordLabel.snp.makeConstraints {
            $0.left.equalTo(self.contentView).inset(15)
            $0.right.equalTo(self.contentView).inset(116)
            $0.top.equalTo(self.separatorView).inset(12)
        }
        
        self.passwordTextField.snp.makeConstraints {
            $0.left.equalTo(self.contentView).inset(15)
            $0.right.equalTo(self.forgotPasswordButton).inset(116)
            $0.top.equalTo(self.passwordLabel).offset(16)
            $0.height.equalTo(19)
        }
        
        self.passwordSeparatorView.snp.makeConstraints {
            $0.left.equalTo(self.contentView).inset(15)
            $0.right.equalTo(self.contentView).inset(16)
            $0.top.equalTo(self.passwordTextField).inset(21)
            $0.height.equalTo(0.5)
        }
        
        self.forgotPasswordButton.snp.makeConstraints {
            $0.right.equalTo(self.contentView).inset(26)
            $0.top.equalTo(self.separatorView).inset(18)
            $0.bottom.equalTo(self.passwordSeparatorView).inset(8)
            $0.height.equalTo(30)
            $0.width.equalTo(113)
        }
        
        self.signInButton.snp.makeConstraints {
            $0.top.equalTo(self.passwordSeparatorView).inset(34)
            $0.height.equalTo(44)
            $0.width.equalTo(147)
            $0.centerX.equalTo(self.contentView)
        }
        
        self.createAccountButton.snp.makeConstraints {
            $0.top.equalTo(self.signInButton).inset(64)
            $0.left.right.equalTo(self.contentView).inset(16)
            $0.centerX.equalTo(self.contentView)
            $0.height.equalTo(18)
            $0.width.equalTo(245)
        }
    }
}
