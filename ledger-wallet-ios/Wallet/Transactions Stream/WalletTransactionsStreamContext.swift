//
//  WalletTransactionsStreamContext.swift
//  ledger-wallet-ios
//
//  Created by Nicolas Bigot on 16/12/2015.
//  Copyright © 2015 Ledger. All rights reserved.
//

import Foundation

final class WalletTransactionsStreamContext {
    
    let remoteTransaction: WalletRemoteTransaction
    var sendOperations: [WalletOperation] = []
    var receiveOperations: [WalletOperation] = []
    var mappedInputs: [WalletTransactionRegularInput: WalletAddress] = [:]
    var mappedOutputs: [WalletTransactionOutput: WalletAddress] = [:]
    
    init(remoteTransaction: WalletRemoteTransaction) {
        self.remoteTransaction = remoteTransaction
    } 

}