//
//  ApiResource.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/16/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation
// Describes where the Resource is located
protocol ApiResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}

extension ApiResource {
    var url: URL {
        var components = URLComponents(string: "http://localhost:3000/")!
        components.path = methodPath
        return components.url!
    }
}
