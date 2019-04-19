//
//  RequestDescriptor.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Alamofire

public struct RequestDescriptor {

    // MARK: - Instance Properties

    public let path: String
    public let method: HTTPMethod
    public let params: Parameters
    public let encoding: ParameterEncoding

    // MARK: - Initializers

    public init(
        path: String,
        method: HTTPMethod,
        params: Parameters,
        encoding: ParameterEncoding
        ) {
        self.path = path
        self.method = method
        self.params = params
        self.encoding = encoding
    }
}
