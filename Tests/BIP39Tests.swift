//
//  BIP39Tests.swift
//  BIP39Tests
//
//  Created by Anh Nguyen on Apr 27, 2020.
//  Copyright © 2020 Bitmark Inc. All rights reserved.
//

@testable import BIP39
import XCTest

class BIP39Tests: XCTestCase {
    
    static var allTests = [
        (testForConvertToInt, testForConvertToWord, testWordsFromSecret),
    ]
    
    func testForConvertToInt() {
//        let data = BIP39Util.decodeBase64(string: "abandon")
        let data = BIP39Util.decodeBase64(string: "vSwMiFeDLVceYF4LXzDB45w7O6jMzTF28yiYpe27Sk8=")
        if let data = data {
            XCTAssertEqual(try BIP39Util.Bip39WordFromMnemonic(word: data), 0)
        }
    }

    func testForConvertToWord() {
        XCTAssertEqual(BIP39Util.Bip39MnemonicFromWord(), "kien")
    }

    func testWordsFromSecret() {
        XCTAssertEqual(BIP39Util.Bip39MnemonicFromWord(), "kien")
    }
    
}
