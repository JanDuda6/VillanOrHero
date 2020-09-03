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
    
    var userResult = 0
    var questionNumber = 1
    var userName = ""

    var tableScores = [String: Int]()

    func checkAnswer(_ userAnswer: String, characterAlignment: String) {

        if userAnswer == characterAlignment {
            userResult += 1
        }
        questionNumber += 1
    }

    func addScoreToDictionary(with key: String, and value: Int) {
            tableScores[key] = value
    }

    func clearQuestionManager() {
        userResult = 0
        questionNumber = 1
        userName = ""
    }

}
