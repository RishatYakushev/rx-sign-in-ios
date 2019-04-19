//
//  NetworkConstants.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case unauthorized
    case invalidJSON
    case invalidError
    case custom(Error)
}

public struct NetworkConstants {
    public static let successCodes: Range<Int> = 200..<300

    public static let unauthorizeCode: Int = 401
}
