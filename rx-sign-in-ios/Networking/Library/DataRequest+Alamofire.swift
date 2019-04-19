//
//  DataRequest+Alamofire.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import Alamofire

public extension DataRequest {
    
    public static func responseSerializer(
        
        // MARK: - Instance Methods

        options: JSONSerialization.ReadingOptions = .allowFragments)
        -> DataResponseSerializer<Data> {
        return DataResponseSerializer { _, response, data, error in
            
            guard let validData = data, validData.count > 0 else {
                return .failure(NetworkError.invalidJSON)
            }
        
            let statusCode = response?.statusCode ?? 0
            if statusCode == NetworkConstants.unauthorizeCode {
                return .failure(NetworkError.unauthorized)
            }
            guard NetworkConstants.successCodes.contains(statusCode) else {
                return .failure(NetworkError.invalidError)
            }
            return .success(validData)
        }
    }
    
    @discardableResult
    func baseResponseJSON(
        queue: DispatchQueue? = nil,
        options: JSONSerialization.ReadingOptions = .allowFragments,
        completionHandler: @escaping (DataResponse<Data>) -> Void)
        -> Self
    {
        return response(
            queue: queue,
            responseSerializer: DataRequest.responseSerializer(options: options),
            completionHandler: completionHandler
        )
    }
}
