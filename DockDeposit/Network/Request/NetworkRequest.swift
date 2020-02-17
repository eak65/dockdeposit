//
//  NetworkRequest.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/16/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType //the return object the data is decoded into
    func decode(_ data: Data) -> ModelType?
    func load(withCompletion completion: @escaping (ModelType?) -> Void)
}

//this base request has the missing information provided by the protocol.
extension NetworkRequest {
    func load(_ url: URL, _ method: String, body: Data? = nil, delegate: URLSessionDelegate? = nil, withCompletion completion: @escaping (ModelType?) -> Void) {
        let session = URLSession(configuration: .default, delegate: delegate, delegateQueue: nil)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = body
        urlRequest.cachePolicy = .useProtocolCachePolicy
        let task = session.dataTask(with: urlRequest, completionHandler: {  (responseData: Data?, response: URLResponse?, error: Error?) -> Void in
          //  guard let wSelf = self else { return }
                guard let responseData = responseData else {
                    completion(nil)
                    return
                }
                completion(self.decode(responseData))
            })
        task.resume()
    }
}
