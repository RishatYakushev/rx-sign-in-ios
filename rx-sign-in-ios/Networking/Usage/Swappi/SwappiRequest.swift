//
//  SwappiNetworkRequest.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Alamofire
import Foundation

public class SwappiRequest: NetworkingRequest {

    // MARK: - Instance Properties

    public typealias ResponseType = TestModel

    // MARK: - Initializers

    init() {}

    // MARK: - Instance Methods

    public func getRequestDescriptor() -> RequestDescriptor {
        return RequestDescriptor(
            path: "people/1/",
            method: .get,
            params: [:],
            encoding: URLEncoding.default
        )
    }
}
