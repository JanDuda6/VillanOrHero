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
    let defaults = UserDefaults.standard
    private init() {}

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
        if var userDefaultsArray = defaults.dictionary(forKey: "TopScore") {
            let topScoreSorted = userDefaultsArray.sorted { $0.1 < $1.1 }

            // checks if name exists in userDefault array and if value is higher than in origin
            for n in 0...3 {

                if topScoreSorted[n].key == key && topScoreSorted[n].value <= value {
                    userDefaultsArray.removeValue(forKey: topScoreSorted[n].key)
                    userDefaultsArray[key] = value
                }
            }

            // check if array has more than 5 elements and if value is higher than origin, if true removes last value and add higher one
            if topScoreSorted.count >= 5 && topScoreSorted[0].value <= value {
                userDefaultsArray.removeValue(forKey: topScoreSorted[0].key)
                userDefaultsArray[key] = value

            } else if topScoreSorted.count < 5 {
                userDefaultsArray[key] = value
            }

            let sortedArray = userDefaultsArray.sorted { $0.1 < $1.1 }

            defaults.set(userDefaultsArray, forKey: "TopScore")

        } else {
            let q = [key: value]
            defaults.set(q, forKey: "TopScore")
        }
    }

    func clearQuestionManager() {
        userResult = 0
        questionNumber = 1
        userName = ""
    }

    func sort(dic dic: [String: Int]) -> [String: Int] {
        

    }




}
