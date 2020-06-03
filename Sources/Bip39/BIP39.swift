//
//  BIP39.swift
//  BIP39
//
//  Created by Kien Nguyen Trung on 4/29/20.
//  Copyright © 2020 Bitmark Inc. All rights reserved.
//

import CBip39
import Foundation

private let mnemonicSparator = " "

public struct BIP39Util {
    
    public static func mnemonicFromWord(_ index: UInt16) -> String {
        var mnemonic: [CChar] = Array(repeating: 0, count: 20)
        CBip39.bip39_mnemonic_from_word(index, &mnemonic)
        return String(cString: mnemonic)
    }

    public static func wordFromMnemonic(_ mnemonic: String) -> Int16 {
        return CBip39.bip39_word_from_mnemonic(mnemonic.cString(using: .ascii))
    }

    public static func mnemonicsFromSecret(_ secret: Data) -> [String]? {
        let maxLength = 1024
        let mnemonic = UnsafeMutablePointer<Int8>.allocate(capacity: maxLength)

        defer {
            mnemonic.deallocate()
        }

        let len = secret.withUnsafeBytes { (unsafeBufferPointer) -> Int in
            guard let sPointer = unsafeBufferPointer.bindMemory(to: UInt8.self).baseAddress else {
                return 0
            }
            return CBip39.bip39_mnemonics_from_secret(sPointer, secret.count, mnemonic, maxLength)
        }

        if len == 0 {
            // Fail case, return empty array
            return nil
        }

        guard let mnemonicPointer = UnsafeBufferPointer(start: mnemonic, count: len).baseAddress else {
            return nil
        }

        let mnemonicString = String(cString: mnemonicPointer)
        return mnemonicString.components(separatedBy: mnemonicSparator)
    }

    public static func secretFromMnemonics(_ mnemonics: [String]) -> Data? {
        let maxLength = 1024
        let mnemonicString = mnemonics.joined(separator: mnemonicSparator)

        var secret = Data(count: maxLength)
        let len = secret.withUnsafeMutableBytes { (unsafeMutableRawBufferPointer) -> Int in
            guard let sPointer = unsafeMutableRawBufferPointer.bindMemory(to: UInt8.self).baseAddress else {
                return 0
            }

            return mnemonicString.withCString { (mPointer) -> Int in
                return CBip39.bip39_secret_from_mnemonics(mPointer, sPointer, maxLength)
            }
        }

        if len == 0 {
            return nil
        }
        
        return secret[0..<len]
    }
}
