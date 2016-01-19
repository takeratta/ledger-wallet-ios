//
//  WalletOperationEntity.swift
//  ledger-wallet-ios
//
//  Created by Nicolas Bigot on 30/11/2015.
//  Copyright © 2015 Ledger. All rights reserved.
//

import Foundation

struct WalletOperationEntity: SQLiteEntityType {
    
    static let tableName = "operation"
    
    static let uidKey = "uid"
    static let amountKey = "amount"
    static let kindKey = "kind"
    static let transactionHashKey = "transaction_hash"
    static let accountIndexKey = "account_index"
    
    static let allFieldKeys =  [
        uidKey,
        amountKey,
        kindKey,
        transactionHashKey,
        accountIndexKey
    ]
    
}