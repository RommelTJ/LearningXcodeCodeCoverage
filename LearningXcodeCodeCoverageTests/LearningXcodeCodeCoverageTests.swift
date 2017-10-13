//
//  LearningXcodeCodeCoverageTests.swift
//  LearningXcodeCodeCoverageTests
//
//  Created by Rommel Rico on 10/13/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import XCTest
@testable import LearningXcodeCodeCoverage

class LearningXcodeCodeCoverageTests: XCTestCase {

    var myVC: ViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ViewController.self))
        myVC = storyboard.instantiateViewController(withIdentifier: "viewControllerID") as! ViewController
        myVC.beginAppearanceTransition(true, animated: false)
    }

    func testEqualOneCharacterStrings() {
        XCTAssert(myVC.checkWord(word: "a", isAnagramOfWord: "a"))
    }
    
}
