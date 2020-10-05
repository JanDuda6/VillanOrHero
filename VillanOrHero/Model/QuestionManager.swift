//
//  QuestionManager.swift
//  MarvelVillanOrHero
//
//  Created by Kurs on 01/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import Foundation

class QuestionManager {
    static let sharedInstance = QuestionManager()
    private init() {}

    let defaults = UserDefaults.standard
    var userResult = 0.00
    var questionNumber = 1
    var userName = ""
    let elementsInFullArray = 5
    var timePoints = 5.00
    var timer: Timer?

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
                if name.trimmingCharacters(in: .whitespaces) == userName.trimmingCharacters(in: .whitespaces) {
                    trueOrFalse = false
                    break
                }
            }
        } else {
            trueOrFalse = true
        }
        return trueOrFalse
    }

    func checkAnswer(_ userAnswer: String, characterAlignment: String) -> Bool {
        var trueOrFalseAnswer = true

        if userAnswer == characterAlignment {
            userResult += 1
            if timePoints > 0 {
                userResult += timePoints
            }
        } else {
            trueOrFalseAnswer = false
        }
        questionNumber += 1
        return trueOrFalseAnswer
    }


    func addScoreToUserDefault(with key: String, and value: Double) {
        // UserDefaults array
        if let userDefaultsArray = defaults.dictionary(forKey: Constants.userDefaultKey) {
            // convert [String: Any] to [String: Double]
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

    func typecastAnyToInt(dictionary: [String: Any]) -> [String: Double] {
        var convertedDictionary = [String: Double]()
        for elements in dictionary {
            convertedDictionary[elements.key] = elements.value as? Double
        }
        return convertedDictionary
    }

    func loadUserDefault() -> [String: Double]? {
        if let userDefaultsArray = defaults.dictionary(forKey: Constants.userDefaultKey) {
            return typecastAnyToInt(dictionary: userDefaultsArray)
        } else {
            return nil
        }
    }

    func roundScore() -> String {
        return String(format: "%.2f", userResult)
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(secondTimer), userInfo: nil, repeats: true)
    }

    @objc func secondTimer() {
        timePoints -= 0.01
    }

    func stopTimer() {
        timer?.invalidate()
        timePoints = 5.00
    }

    func clearQuestionManager() {
        userResult = 0
        questionNumber = 1
        userName = ""
    }
}
