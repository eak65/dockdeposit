//
//  Wrapper.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/16/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation

struct Wrapper <T:Decodable> : Decodable {
    let items: [T]
}
