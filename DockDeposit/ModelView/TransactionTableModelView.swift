//
//  TransactionTableModelView.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/17/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation

struct TransactionTableModelView {
    
    let transaction: Transaction
    
    var title : String {
        guard let overView = transaction.overView else {
            return ""
        }
        return overView
    }
    
    var description : String {
        guard let description = transaction.description else {
            return ""
        }
        return description
    }
    
    var fee : String {
        guard let fee = transaction.creatorFee else {
               return ""
           }
        return "$\(fee)"
       }
}
