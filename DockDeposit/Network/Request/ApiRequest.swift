//
//  ApiRequest.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/16/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation

class ApiRequest <Resource: ApiResource> : NSObject, URLSessionDelegate {
    let resource: Resource
    let method: String
    var data: Data?
    init(resource: Resource, method: String = "GET", data: Data? = nil) {
        self.resource = resource
        self.method = method
        self.data = data
    }
}

// conforms NetworkRequest protocol
extension ApiRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.ModelType]? {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let wrapper = try decoder.decode(Wrapper<Resource.ModelType>.self, from: data)
            return wrapper.items
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func load(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        load(self.resource.url, self.method, body: data, delegate:self, withCompletion: completion)
    }
}
