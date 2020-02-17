//
//  Transaction.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/17/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    let id : Int
    var creatorId : Int
    var creationDate : Date?
    let startDate : Date?
    var location : String?
    var creatorFee : Decimal?
    var overView: String?
    var description : String?
    
}
