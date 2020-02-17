//
//  ApiRequest.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/16/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation

class ApiRequest <Resource: ApiResource> {
    let resource: Resource
    let method: String
    init(resource: Resource, method: String) {
        self.resource = resource
        self.method = method
    }
}

// conforms NetworkRequest protocol
extension ApiRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.ModelType]? {
        let wrapper = try? JSONDecoder().decode(Wrapper<Resource.ModelType>.self, from: data)
        return wrapper?.items
    }
    
    func load(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        load(self.resource.url, self.method, withCompletion: completion)
    }
}
