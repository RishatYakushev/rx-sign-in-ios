//
//  NetworkGateway.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Alamofire
import RxSwift
import RxCocoa

// MARK: - Enumeration Cases

enum UploadType: String {
    case file
}

// MARK: - Enumeration Cases

enum UploadMimeType: String {
    case jpeg = "image/jpeg"
}

public protocol NetworkingGateway {
    
    // MARK: - Instance Methods

    func json<T: NetworkingRequest>(_ request: T) -> Single<T.ResponseType>
    func data<T: NetworkingRequest>(_ request: T) -> Single<Data>
}
