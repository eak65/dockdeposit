//
//  UserResource.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/17/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation

struct UserResource : ApiResource {
    typealias ModelType = User
    var id: Int?
    init(id: Int) {
        self.id = id
        self.methodPath = "\(self.methodPath)/\(id)"
    }
    var methodPath: String = "/users"
}

struct TransactionResource : ApiResource {
    typealias ModelType = Transaction
    var methodPath: String = "/transactions"
}
