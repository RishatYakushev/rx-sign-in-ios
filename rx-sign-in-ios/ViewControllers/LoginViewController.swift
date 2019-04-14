//
//  LoginViewController.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 14/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // MARK: - Instance Properties
    
    private let loginView = LoginView()
    
    public let viewModel: LoginViewModel
    
    // MARK: - Initializers
    
    private let disposeBag: DisposeBag = .init()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance Methods
    
    @discardableResult
    private func configureOutput(_ viewModel: LoginViewModel) -> [Disposable] {
        return [
            loginView.mailTextField.rx.text.orEmpty.bind(to: viewModel.userName),
            
            loginView.passwordTextField.rx.text.orEmpty.bind(to: viewModel.userPassword),
            
            // MARK: -
            
            viewModel.isLoginEnabled.asObservable().bind(to: loginView.signInButton.rx.isEnabled)
        ]
    }
    
    // MARK: - TODO
    
    //    private func checkEmail() {
    //        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    //        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    //        sendButton.isEnabled = emailTest.evaluate(with: emailTextField.text)
    //    }
    
    private func setupLoginView() {
        view.addSubview(loginView)
        
        self.loginView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
    }
    
    private func setupNavigationBar() {
        ViewStyling.NavigationBar.loginStyle(navigationController!.navigationBar)
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureOutput(viewModel).forEach { $0.disposed(by: disposeBag) }
        self.setupLoginView()
        self.setupNavigationBar()
    }
}
