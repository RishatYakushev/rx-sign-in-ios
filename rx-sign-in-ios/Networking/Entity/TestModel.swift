//
//  TestModel.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Foundation
import Gloss

public struct TestModel: Glossy {
    
    // MARK: - Instance Properties

    public let categories : String?
    
    // MARK: - Initializers

    public init?(json: JSON){
        categories = "name" <~~ json
    }
    
    // MARK: - Instance Methods

    public func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> categories
        ])
    }
}
