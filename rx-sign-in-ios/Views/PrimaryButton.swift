//
//  PrimaryButton.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import UIKit

@IBDesignable final class PrimaryButton: Button {

    // MARK: - Instance Properties

    private var acitivityIndicatorView = UIActivityIndicatorView()

    // MARK: - Initializers

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.initialize()
    }

    // MARK: - Instance Methods

    private func initialize() {
        self.acitivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.acitivityIndicatorView.color = Colors.tangerine
        self.acitivityIndicatorView.hidesWhenStopped = true

        self.addSubview(self.acitivityIndicatorView)

        self.defaultTitleColor = Colors.white
        self.defaultBackgroundColor = Colors.tangerine

        self.disabledTitleColor = Colors.blackText
        self.disabledBackgroundColor = Colors.disabled

        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)

        self.cornerRadius = 8.0

        NSLayoutConstraint.activate([self.acitivityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     self.acitivityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
    }

    // MARK: -

    func showAcitvityIndicator() {
        if !self.acitivityIndicatorView.isAnimating {
            self.acitivityIndicatorView.startAnimating()
        }
    }

    func hideActivityIndicator() {
        self.acitivityIndicatorView.stopAnimating()
    }
}
