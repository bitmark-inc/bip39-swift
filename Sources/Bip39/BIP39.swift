//
//  BIP39.swift
//  BIP39
//
//  Created by Kien Nguyen Trung on 4/29/20.
//  Copyright © 2020 Bitmark Inc. All rights reserved.
//

import Foundation
import CBip39

struct BIP39Util {
    public static func encodeBase64(data: Data) -> String {
        return data.base64EncodedString()
    }

    public static func decodeBase64(string: String) -> Data? {
        return Data(base64Encoded: string)
    }

    public static func mnemonicFromWord() -> String {
        var mnemonic = Data()
        _ = mnemonic.withUnsafeMutableBytes { (hPointer: UnsafeMutablePointer<Int8>) -> Void in
            CBip39.bip39_mnemonic_from_word(20, hPointer)
        }
        return String(data: mnemonic, encoding: .utf8)!
    }

    public static func wordFromMnemonic(word: Data) throws -> Int16 {
        let result = word.withUnsafeBytes { (mPointer: UnsafePointer<Int8>) -> Int16 in
            CBip39.bip39_word_from_mnemonic(mPointer)
        }
        return result
    }

    public static func wordsFromSecret() throws -> Int{
        let secret = Data()
        var words = Data()
        let result = secret.withUnsafeBytes { (sPointer: UnsafePointer<UInt8>) -> Int in
            return words.withUnsafeMutableBytes { (wPointer: UnsafeMutablePointer<UInt16>) -> Int in
                return CBip39.bip39_words_from_secret(sPointer, 12, wPointer, 12)
            }
        }
        return result
    }

    public static func mnemonicsFromSecret() throws -> Int{
        let secret = Data()
        var mnemonics = Data()

        let result = secret.withUnsafeBytes { (sPointer: UnsafePointer<UInt8>) -> Int in
            return mnemonics.withUnsafeMutableBytes { (mPointer: UnsafeMutablePointer<Int8>) -> Int in
                return CBip39.bip39_mnemonics_from_secret(sPointer, 12, mPointer, 12)
            }
        }

        return result
    }

    public static func wordsFromMnemonics() throws -> Int {
        let mnemonics = Data()
        var words = Data()
        let result = mnemonics.withUnsafeBytes { (mPointer: UnsafePointer<Int8>) -> Int in
            return words.withUnsafeMutableBytes { (wPointer: UnsafeMutablePointer<UInt16>) -> Int in
                CBip39.bip39_words_from_mnemonics(mPointer, wPointer, 12)
            }
        }

        return result
    }

    public static func secretFromMnemonics() throws -> Int {
        let mnemonics = Data()
        var secret = Data()
        let result = mnemonics.withUnsafeBytes { (mPointer: UnsafePointer<Int8>) -> Int in
            return secret.withUnsafeMutableBytes { (sPointer: UnsafeMutablePointer<UInt8>) -> Int in
                CBip39.bip39_secret_from_mnemonics(mPointer, sPointer, 12)
            }
        }
        return result
    }
}
