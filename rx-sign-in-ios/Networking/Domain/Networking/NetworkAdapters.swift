//
//  NetworkAdapters.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Foundation

public protocol NetworkingAdapter {
    
    // MARK: - Instance Methods

    func header(descriptor: RequestDescriptor) -> [String: String]
}
