//
//  Pokemon.swift
//  MarvelVillanOrHero
//
//  Created by Kurs on 27/08/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import Foundation

struct CharacterData: Decodable {
    var name: String
    var biography: Biography
    var image: Image
}

struct Biography: Decodable {
    var publisher: String
    var alignment: String
}

struct Image: Decodable {
    var url: String
}
