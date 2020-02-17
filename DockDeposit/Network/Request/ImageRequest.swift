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
    
    init (url: URL, method: String) {
        self.url = url
        self.method = method
    }
}

extension ImageRequest: NetworkRequest {
    
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func load(withCompletion completion: @escaping (UIImage?) -> Void) {
        load(self.url, self.method, withCompletion: completion)
    }
}
