//
//  User.swift
//  PokeWars
//
//  Created by Kurs on 02/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var score: Int

    init(name: String) {
        self.name = name
        score = 0
    }
}
