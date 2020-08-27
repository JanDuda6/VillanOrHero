//
//  Pokemon.swift
//  PokeWars
//
//  Created by Kurs on 27/08/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import Foundation

struct CharacterData: Decodable {
    var name: String
    var biography: Biography
}

struct Biography: Decodable {
    var publisher: String
    var alignment: String
}
