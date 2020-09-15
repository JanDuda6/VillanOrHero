//
//  QuestionManager.swift
//  PokeWars
//
//  Created by Kurs on 01/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import Foundation

class QuestionManager {
    static let sharedInstance = QuestionManager()
    private init() {}

    let defaults = UserDefaults.standard
    var userResult = 0
    var questionNumber = 1
    var userName = ""
    let elementsInFullArray = 5

    func checkUserName(userName: String) -> Bool {
        var trueOrFalse = true
        // checks if userName has only whitespaces
        if userName.trimmingCharacters(in: .whitespaces).isEmpty {
            trueOrFalse = false
            return trueOrFalse
        }
        if let usersNames = defaults.dictionary(forKey: Constants.userDefaultKey)?.keys {
            // checks if userName exists in "TopScoreArray"
            for name in usersNames {
                if name == userName { trueOrFalse = false; break }
            }
        } else {
            trueOrFalse = true
        }
        return trueOrFalse
    }

    func checkAnswer(_ userAnswer: String, characterAlignment: String) {
        userAnswer == characterAlignment ? (userResult += 1) : (userResult += 0)
        questionNumber += 1
    }

    func addScoreToUserDefault(with key: String, and value: Int) {
        // UserDefaults array
        if let userDefaultsArray = defaults.dictionary(forKey: Constants.userDefaultKey) {
            // convert [String: Any] to [String: Int]
            var convertedDict = typecastAnyToInt(dictionary: userDefaultsArray)
            // sort by value
            let topScoreSorted = convertedDict.sorted {$0.1 < $1.1}
            // checks if array has more than 5 elements, if true removes last value and add higher one
            if topScoreSorted.count >= elementsInFullArray && topScoreSorted.first!.value <= value {
                convertedDict.removeValue(forKey: topScoreSorted.first!.key)
                convertedDict[key] = value
            }

            if topScoreSorted.count < elementsInFullArray {
                convertedDict[key] = value
            }
            defaults.set(convertedDict, forKey: Constants.userDefaultKey)

        } else {
            let q = [key: value]
            defaults.set(q, forKey: Constants.userDefaultKey)
        }
    }

    func typecastAnyToInt(dictionary: [String: Any]) -> [String: Int] {
        var convertedDictionary = [String: Int]()

        for elements in dictionary {
            convertedDictionary[elements.key] = elements.value as? Int
        }
        return convertedDictionary
    }

    func loadUserDefault() -> [String: Int]? {
        if let userDefaultsArray = defaults.dictionary(forKey: Constants.userDefaultKey) {
            return typecastAnyToInt(dictionary: userDefaultsArray)
        } else {
            return nil
        }
    }

    func clearQuestionManager() {
        userResult = 0
        questionNumber = 1
        userName = ""
    }
}
