//
//  With.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 12/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Foundation

@discardableResult
public func with<A: AnyObject>(_ value: A, _ configure: (A) -> Void) -> A {
    configure(value)
    return value
}
