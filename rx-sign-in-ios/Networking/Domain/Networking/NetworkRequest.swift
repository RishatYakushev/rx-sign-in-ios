//
//  NetworkRequest.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Foundation
import Gloss

public protocol NetworkingRequest {

    // MARK: - Nested Types

    associatedtype ResponseType: Glossy

    // MARK: - Instance Methods

    func getRequestDescriptor() -> RequestDescriptor
}

public protocol UploadNetworkingRequest: NetworkingRequest {

    // MARK: - Instance Properties

    var uploadData: Data { get }
    var path: String { get }
}
