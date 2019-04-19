//
//  SwappiNetworking.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import RxSwift
import RxCocoa

public protocol SwappiNetworking {
    
    func getPeople() -> Single<TestModel>
}

public class SwappiNetworkingImp {
    
    // MARK: - Instance Properties

    private let networking: NetworkingGateway
    
    // MARK: - Instance Methods

    public init(networking: NetworkingGateway) {
        self.networking = networking
    }
}

extension SwappiNetworkingImp: SwappiNetworking {
    
    // MARK: - Instance Methods

    public func getPeople() -> Single<TestModel> {
        return networking.json(SwappiRequest())
    }
}
