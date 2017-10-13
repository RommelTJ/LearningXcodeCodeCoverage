//
//  ViewController.swift
//  LearningXcodeCodeCoverage
//
//  Created by Rommel Rico on 10/13/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func checkWord(word: String, isAnagramOfWord: String) -> Bool {

        // Strip the whitespace and make both of the strings lowercase
        let noWhitespaceOriginalString = word.replacingOccurrences(of: " ", with: "").lowercased()
        let noWhitespaceComparisonString = isAnagramOfWord.replacingOccurrences(of: " ", with: "").lowercased()

        // If they have different lengths, they are definitely not anagrams
        guard noWhitespaceOriginalString.characters.count == noWhitespaceComparisonString.characters.count else { return false }

        // If they have no content, default to true.
        guard noWhitespaceOriginalString.characters.count > 0 else { return true }

        // If the strings are the same, they must be anagrams of each other!
        guard noWhitespaceOriginalString != noWhitespaceComparisonString else { return true }

        // Go through every character in the original string.
        var dict = [Character: Int]()
        for index in 1...noWhitespaceOriginalString.characters.count {
            // Find the index of the character at position i, then store the character.
            let originalWordIndex = noWhitespaceComparisonString.index(noWhitespaceComparisonString.startIndex, offsetBy: index - 1)
            let originalWordCharacter = noWhitespaceOriginalString[originalWordIndex]

            // Do the same as above for the compared word.
            let comparedWordIndex = noWhitespaceComparisonString.index(noWhitespaceComparisonString.startIndex, offsetBy: index - 1)
            let comparedWordCharacter = noWhitespaceComparisonString[comparedWordIndex]
            
            // Increment the value in the dictionary for the original word character. If it doesn't exist, set it to 0 first.
            dict[originalWordCharacter] = (dict[originalWordCharacter] ?? 0) + 1
            // Do the same for the compared word character, but this time decrement instead of increment.
            dict[comparedWordCharacter] = (dict[comparedWordCharacter] ?? 0) - 1
        }
        
        // If all values are 0, the string are anagrams. Otherwise, they are not anagrams.
        let filteredDict = dict.filter({ $0.1 != 0 })
        if filteredDict.count == 0 {
            return true
        } else {
            return false
        }
    }

}

