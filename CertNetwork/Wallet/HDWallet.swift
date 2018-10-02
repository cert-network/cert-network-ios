//
//  HDWallet.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
import HDWalletKitSwift

class HDWallet {
    
    static let shared = HDWallet()
    // your  mnemonic
    let seed = Mnemonic.createSeed(mnemonic: "xxxxxxxxx")
    
    var wallet: Wallet {
        return Wallet(seed: seed, network: .main(.eth))
    }
    
    func getAddress() -> String {
        return wallet.generateAddress(at: 0)
    }

    func getPrivateKey() -> String {
        return wallet.privateKey(with: "m/44'/60'/0'/0/0").raw.toHexString()
    }
    
    func getPublicKey() -> String {
        return wallet.privateKey(with: "m/44'/60'/0'/0/0").publicKey.raw.toHexString()
    }
}
