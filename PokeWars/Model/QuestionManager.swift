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


        var topScoreArray = defaults.dictionary(forKey: "TopScore")!


    



        topScoreArray[key] = value









        defaults.set(topScoreArray, forKey: "TopScore")
    }

    func clearQuestionManager() {
        userResult = 0
        questionNumber = 1
        userName = ""
    }

}
