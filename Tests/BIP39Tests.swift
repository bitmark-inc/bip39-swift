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
    
    func testWordIndex() {
        // indexes to words
        XCTAssertEqual(BIP39Util.mnemonicFromWord(1), "ability")
        XCTAssertEqual(BIP39Util.mnemonicFromWord(26), "addict")
        
        // words to indexes
        XCTAssertEqual(BIP39Util.wordFromMnemonic("ability"), 1)
        XCTAssertEqual(BIP39Util.wordFromMnemonic("addict"), 26)
    }

    func testMnemonicsFromSecret() {
        XCTAssertEqual(BIP39Util.mnemonicsFromSecret(Data(hexString: "baadf00dbaadf00d")!), ["rival",
                                                                                             "hurdle",
                                                                                             "address",
                                                                                             "inspire",
                                                                                             "tenant",
                                                                                             "alone"])
        
        XCTAssertEqual(BIP39Util.mnemonicsFromSecret(Data(hexString: "baadf00dbaadf00dbaadf00dbaadf00d")!), ["rival",
                                                                                                             "hurdle",
                                                                                                             "address",
                                                                                                             "inspire",
                                                                                                             "tenant",
                                                                                                             "almost",
                                                                                                             "turkey",
                                                                                                             "safe",
                                                                                                             "asset",
                                                                                                             "step",
                                                                                                             "lab",
                                                                                                             "boy"])
        
        XCTAssertEqual(BIP39Util.mnemonicsFromSecret(Data(hexString: "baadf00dbaadf00dbaadf00dbaadf00dff")!), nil)
        
        XCTAssertEqual(BIP39Util.mnemonicsFromSecret(Data(hexString: "7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f")!), ["legal",
                                                                                                             "winner",
                                                                                                             "thank",
                                                                                                             "year",
                                                                                                             "wave",
                                                                                                             "sausage",
                                                                                                             "worth",
                                                                                                             "useful",
                                                                                                             "legal",
                                                                                                             "winner",
                                                                                                             "thank",
                                                                                                             "yellow"])
    }
    
    func testSecretFromMnemonic() {
        XCTAssertEqual(BIP39Util.secretFromMnemonics(["rival",
                                                      "hurdle",
                                                      "address",
                                                      "inspire",
                                                      "tenant",
                                                      "alone"]),
                       Data(hexString: "baadf00dbaadf00d")!)
        
        XCTAssertEqual(BIP39Util.secretFromMnemonics(["rival",
                                                      "hurdle",
                                                      "address",
                                                      "inspire",
                                                      "tenant",
                                                      "almost",
                                                      "turkey",
                                                      "safe",
                                                      "asset",
                                                      "step",
                                                      "lab",
                                                      "boy"]),
                       Data(hexString: "baadf00dbaadf00dbaadf00dbaadf00d")!)
                
        XCTAssertEqual(BIP39Util.secretFromMnemonics(["legal",
                                                      "winner",
                                                      "thank",
                                                      "year",
                                                      "wave",
                                                      "sausage",
                                                      "worth",
                                                      "useful",
                                                      "legal",
                                                      "winner",
                                                      "thank",
                                                      "yellow"]),
                       Data(hexString: "7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f")!)
    }
}

extension Data {
    init?(hexString: String) {
        let len = hexString.count / 2
        var data = Data(capacity: len)
        for i in 0..<len {
            let j = hexString.index(hexString.startIndex, offsetBy: i*2)
            let k = hexString.index(j, offsetBy: 2)
            let bytes = hexString[j..<k]
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
        }
        self = data
    }
}
