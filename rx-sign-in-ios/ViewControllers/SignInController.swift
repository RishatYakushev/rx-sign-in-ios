//
//  SignInController.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 14/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController {
    
    // MARK: - Instance Properties
    
    private let signInView = SignInView()
    
    public let viewModel: SignInViewModel
    
    // MARK: - Initializers
    
    private let disposeBag: DisposeBag = .init()
    
    private lazy var swappiNetworking: SwappiNetworking = SwappiNetworkingImp(
        networking: AppDelegate.networking
    )
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance Methods
    
    @discardableResult
    private func configureOutput(_ viewModel: SignInViewModel) -> [Disposable] {
        return [
            signInView.mailTextField.rx.text.orEmpty.bind(to: viewModel.userName),
            
            signInView.passwordTextField.rx.text.orEmpty.bind(to: viewModel.userPassword),
            
            signInView.signInButton.rx.tap.bind {
                self.swappiNetworking.getPeople().subscribe(onSuccess: { [weak self] (emptyObject) in
                    print(emptyObject)
                }) { [weak self]  (error) in
                    print(error)
                }
            },
            
            // MARK: -
            
            viewModel.isLoginEnabled.asObservable().bind(to: signInView.signInButton.rx.isEnabled)
        ]
    }
    
    // MARK: - TODO
    
    private func setupLoginView() {
        view.addSubview(signInView)
        
        self.signInView.snp.makeConstraints { (make) in
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
