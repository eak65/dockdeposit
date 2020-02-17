//
//  ImageRequest.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/16/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation
import UIKit

class ImageRequest {
    let url: URL
    let method: String
    var body : Data?
    init (url: URL, method: String = "GET", body: Data? = nil) {
        self.url = url
        self.method = method
        self.body = body
    }
}

extension ImageRequest: NetworkRequest {
    
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func load(withCompletion completion: @escaping (UIImage?) -> Void) {
        load(self.url, self.method, body: body, withCompletion: completion)
    }
}
