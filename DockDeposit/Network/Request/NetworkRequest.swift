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
    func load(_ url: URL, _ method: String,_ body: Codable? = nil, withCompletion completion: @escaping (ModelType?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        
        let task = session.dataTask(with: urlRequest, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
                guard let data = data else {
                    completion(nil)
                    return
                }
                completion(self?.decode(data))
            })
        task.resume()
    }
}
