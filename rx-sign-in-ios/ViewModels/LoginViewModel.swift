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

// MARK: - Передаем сразу на MainTrade (Trade Safe)

protocol SignInViewModel {
    func signIn() -> Driver<Bool>
    
    var userName: Variable<String> { get }
    var userPassword: Variable<String> { get }
    
    var isLoginEnabled: Driver<Bool> { get }
}

class SignInViewModelImp: SignInViewModel {
    init() { }

    public let userName: Variable<String> = Variable<String>("")
    public let userPassword: Variable<String> = Variable<String>("")
    
    // MARK: - Объединяем Observable у userName, userPassword
    
    var isLoginEnabled: Driver<Bool> {
        return Observable.combineLatest(userPassword.asObservable(), userName.asObservable()) { password, user in
            !user.isEmpty && !password.isEmpty && user.isValidEmail()
        }.asDriver(onErrorJustReturn: false)
    }
    
    func signIn() -> Driver<Bool> {
        return Driver.just(true)
    }
}
