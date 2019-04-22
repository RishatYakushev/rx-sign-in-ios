//
//  LoginViewModel.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 12/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol SignInViewModel {

    // MARK: - Instance Properties

    var userName: Variable<String> { get }
    var userPassword: Variable<String> { get }

    var isLoginEnabled: Driver<Bool> { get }

    // MARK: - Instance Methods

    func signIn() -> Driver<Bool>
}

class SignInViewModelImp: SignInViewModel {

    // MARK: - Initializers

    init() {}

    // MARK: - Instance Properties

    public let userName: Variable<String> = Variable<String>("")
    public let userPassword: Variable<String> = Variable<String>("")

    var isLoginEnabled: Driver<Bool> {
        return Observable.combineLatest(userPassword.asObservable(), userName.asObservable()) { password, user in
            !user.isEmpty && !password.isEmpty && user.isValidEmail() && password.isValidPassword()
        }.asDriver(onErrorJustReturn: false)
    }

    // MARK: - Instance Methods

    func signIn() -> Driver<Bool> {
        return Driver.just(true)
    }
}
