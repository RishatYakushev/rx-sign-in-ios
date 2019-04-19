//
//  NetworkGatewayImp.swift
//  rx-sign-in-ios
//
//  Created by Rishat Yakushev on 11/04/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//
import Alamofire
import RxCocoa
import RxSwift
import Gloss

public class NetworkingGatewayImp {
    
    // MARK: - Instance Properties
    
    private let sessionManager: SessionManager
    private let baseUrl: URL
    private let prefix: String
    private let adapters: [NetworkingAdapter]
    
    private let queue: DispatchQueue = .init(
        label: String(describing: NetworkingGateway.self),
        qos: .background
    )
    
    // MARK: - Initializers
    
    public init(
        sessionManager: SessionManager,
        baseUrl: URL,
        prefix: String,
        adapters: [NetworkingAdapter]
        ) {
        self.sessionManager = sessionManager
        self.baseUrl = baseUrl
        self.prefix = prefix
        self.adapters = adapters
    }
    
    // MARK: - Instance Methods
    
    private func createUrlRequest<T: NetworkingRequest>(_ request: T) throws -> URLRequest {
        let requestDescriptor = request.getRequestDescriptor()
        let url = baseUrl
            .appendingPathComponent(prefix)
            .appendingPathComponent(requestDescriptor.path)
        var urlRequest = try URLRequest(url: url, method: requestDescriptor.method)
        urlRequest = try applyAdapter(urlRequest, requestDescriptor: requestDescriptor)
        return try requestDescriptor.encoding.encode(urlRequest, with: requestDescriptor.params)
    }
    
    private func applyAdapter(
        _ urlRequest: URLRequest,
        requestDescriptor: RequestDescriptor
        ) throws -> URLRequest {
        var urlRequest = urlRequest
        
        adapters.forEach { adapter in
            let headers = adapter.header(descriptor: requestDescriptor)
            headers.forEach { key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return urlRequest
    }
}

extension NetworkingGatewayImp: NetworkingGateway {
    
    // MARK: - Instance Methods

    public func json<T: NetworkingRequest>(_ request: T) -> Single<T.ResponseType> {
        return data(request)
            .map { data in
                guard let object = T.ResponseType(data: data) else {
                    throw NetworkError.invalidJSON
                }
                return object
            }
    }
    
    public func data<T: NetworkingRequest>(_ request: T) -> Single<Data> {
        return Single.create(subscribe: { (single) -> Disposable in
            do {
                let urlRequest = try self.createUrlRequest(request)
                Alamofire
                    .request(urlRequest)
                    .baseResponseJSON(completionHandler: { (response) in
                        switch response.result {
                        case .success(let responseData):
                           single(.success(responseData))
                        case .failure(let error):
                            single(.error(error))
                        }
                    })
            }
            catch {
                 single(.error(error))
            }
            
            return Disposables.create()
        })
    }
}
