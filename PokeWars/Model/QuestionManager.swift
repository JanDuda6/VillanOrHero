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

    func checkAnswer(_ userAnswer: String, characterAlignment: String) {

        if userAnswer == characterAlignment {
            userResult += 1
        }
        questionNumber += 1
    }

    func addScoreToUserDefault(with key: String, and value: Int) {

        // UserDefaults array
        if let userDefaultsArray = defaults.dictionary(forKey: "TopScore") {

            // convert [String: Any] to [String: Int]
            var convertedDict = convertToStringIntDictionary(dictionary: userDefaultsArray)

            // sort by value
            let topScoreSorted = convertedDict.sorted {$0.1 < $1.1}

            // checks if name exists in userDefault array and if value is higher than in origin
            for n in 0...topScoreSorted.count - 1 {
                if topScoreSorted[n].key == key && topScoreSorted[n].value <= value {
                    convertedDict.removeValue(forKey: topScoreSorted[n].key)
                    convertedDict[key] = value
                }
            }

            // check if array has more than 5 elements and if value is higher than origin, if true removes last value and add higher one
            if topScoreSorted.count >= 5 && topScoreSorted[0].value <= value {
                convertedDict.removeValue(forKey: topScoreSorted[0].key)
                convertedDict[key] = value

            } else if topScoreSorted.count < 5 {
                convertedDict[key] = value
            }
            defaults.set(convertedDict, forKey: "TopScore")

        } else {
            let q = [key: value]
            defaults.set(q, forKey: "TopScore")
        }
    }

    func convertToStringIntDictionary(dictionary: [String: Any]) -> [String: Int] {

        var convertedDictionary = [String: Int]()

        for elements in dictionary {
            convertedDictionary[elements.key] = elements.value as? Int
        }
        return convertedDictionary
    }

    func loadUserDefault() -> [String: Int]? {
        if let userDefaultsArray = defaults.dictionary(forKey: "TopScore") {
            return convertToStringIntDictionary(dictionary: userDefaultsArray)
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
