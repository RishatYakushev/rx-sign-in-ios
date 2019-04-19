//
//  UIViewStyling.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 12/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import UIKit

public struct ViewStyling {

    // MARK: - Nested Types

    fileprivate enum Constants {

        // MARK: - Nested Properties

        static let navigationBarTitle = "Authorization".localized()
    }

    public struct NavigationBar {
        public static let loginStyle: (UINavigationBar) -> Void = {
            $0.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
            $0.barTintColor = UIColor.white
            $0.topItem?.title = Constants.navigationBarTitle
        }
    }
}
