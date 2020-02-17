//
//  User.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/16/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let firstName: String
    var lastName: String?
    var email: String?
}
