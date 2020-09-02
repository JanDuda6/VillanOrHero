//
//  QuestionManager.swift
//  PokeWars
//
//  Created by Kurs on 01/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import Foundation

struct QuestionManager {
    var userResult = 0
    var questionNumber = 1
    
    mutating func checkAnswer(_ userAnswer: String, characterAlignment: String) {

        if userAnswer == characterAlignment {
            userResult += 1
        }
        questionNumber += 1
    }
}