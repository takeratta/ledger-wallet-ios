//
//  WalletAccount.swift
//  ledger-wallet-ios
//
//  Created by Nicolas Bigot on 02/12/2015.
//  Copyright © 2015 Ledger. All rights reserved.
//

import Foundation

struct WalletAccount {
    
    let index: Int
    let extendedPublicKey: String
    let nextInternalIndex: Int
    let nextExternalIndex: Int
    let name: String?
    let hidden: Bool
    let balance: Int64
    var isUsed: Bool { return nextExternalIndex > 0 || nextInternalIndex > 0 }
    
    func withNextInternalIndex(index: Int) -> WalletAccount {
        return WalletAccount(index: self.index, extendedPublicKey: extendedPublicKey, nextInternalIndex: index, nextExternalIndex: nextExternalIndex, name: name, hidden: hidden, balance: balance)
    }
    
    func withNextExternalIndex(index: Int) -> WalletAccount {
        return WalletAccount(index: self.index, extendedPublicKey: extendedPublicKey, nextInternalIndex: nextInternalIndex, nextExternalIndex: index, name: name, hidden: hidden, balance: balance)
    }
    
    // MARK: Initialization
    
    init(index: Int, extendedPublicKey: String, name: String?) {
        self.init(index: index, extendedPublicKey: extendedPublicKey, nextInternalIndex: 0, nextExternalIndex: 0, name: name, hidden: false, balance: 0)
    }
    
    init(index: Int, extendedPublicKey: String, nextInternalIndex: Int, nextExternalIndex: Int, name: String?, hidden: Bool, balance: Int64) {
        self.index = index
        self.extendedPublicKey = extendedPublicKey
        self.name = name
        self.nextExternalIndex = nextExternalIndex
        self.nextInternalIndex = nextInternalIndex
        self.hidden = hidden
        self.balance = balance
    }
    
}

// MARK: - SQLiteFetchableModel

extension WalletAccount: SQLiteFetchableModel {
        
    init?(resultSet: SQLiteStoreResultSet) {
        guard let
            index = resultSet.integerForKey(WalletAccountEntity.fieldKeypathWithKey(WalletAccountEntity.indexKey)),
            extendedPublicKey = resultSet.stringForKey(WalletAccountEntity.fieldKeypathWithKey(WalletAccountEntity.extendedPublicKeyKey)),
            nextInternalIndex = resultSet.integerForKey(WalletAccountEntity.fieldKeypathWithKey(WalletAccountEntity.nextInternalIndexKey)),
            nextExternalIndex = resultSet.integerForKey(WalletAccountEntity.fieldKeypathWithKey(WalletAccountEntity.nextExternalIndexKey)),
            hidden = resultSet.boolForKey(WalletAccountEntity.fieldKeypathWithKey(WalletAccountEntity.hiddenKey)),
            balance = resultSet.integer64ForKey(WalletAccountEntity.fieldKeypathWithKey(WalletAccountEntity.balanceKey))
        else {
            return nil
        }
        
        self.index = index
        self.extendedPublicKey = extendedPublicKey
        self.nextInternalIndex = nextInternalIndex
        self.nextExternalIndex = nextExternalIndex
        self.name = resultSet.stringForKey(WalletAccountEntity.fieldKeypathWithKey(WalletAccountEntity.nameKey))
        self.hidden = hidden
        self.balance = balance
    }
    
}