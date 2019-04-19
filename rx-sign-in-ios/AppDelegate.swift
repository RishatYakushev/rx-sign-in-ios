//
//  AppDelegate.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 14/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Instance Properties

    var window: UIWindow?
    
    static let networking = NetworkingGatewayImp(
        sessionManager: SessionManager.default,
        baseUrl: BaseConstants.Networking.baseURL,
        prefix: "",
        adapters: []
    )

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let viewController = SignInViewController(viewModel: SignInViewModelImp())
        let navigationViewController = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigationViewController
        return true
    }
}
