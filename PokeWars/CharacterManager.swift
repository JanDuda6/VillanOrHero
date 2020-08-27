//
//  Json.swift
//  PokeWars
//
//  Created by Kurs on 27/08/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import Foundation

struct CharacterManager {

    let urlApi = "https://pokeapi.co/api/v2/pokemon/"

    func fetchCharacter() {
        let randomInt = Int.random(in: 1...50)
        let urlToString = "\(urlApi)&\(randomInt)"
        performURLSession(url: urlToString)
    }

    func performURLSession(url: String) {}


    func parseJson(datatoDecode: Data) {}

}
