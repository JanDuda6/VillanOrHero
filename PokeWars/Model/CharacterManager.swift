//
//  Json.swift
//  PokeWars
//
//  Created by Kurs on 27/08/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import Foundation
import UIKit

protocol CharacterManagerDelegate {
    func didReceiveCharacterUpdate(_ characterManager: CharacterManager, character: Character)
}

struct CharacterManager {

    let url = "https://www.superheroapi.com/api.php/10214070745402015/"

    var delegate: CharacterManagerDelegate?

    func fetchCharacter() {
        let randomInt = Int.random(in: 1...733)
        let urlToString = "\(url)\(randomInt)"
        performURLSession(stringURL: urlToString)
    }

    func performURLSession(stringURL: String) {
        if let url = URL(string: stringURL) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error with URLSession \(error!)")
                    return
                }
                if let dataToDecode = data {
                    if let character = self.parseJson(with: dataToDecode) {
                        if character.publisher != "Marvel Comics" {
                            self.fetchCharacter()
                        } else {
                            self.delegate?.didReceiveCharacterUpdate(self, character: character)
                        }
                    }
                }
            }
            task.resume()
        }
    }

    func parseJson(with data: Data) -> Character! {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CharacterData.self, from: data)
            let name = decodedData.name
            let publisher = decodedData.biography.publisher
            let alignment = decodedData.biography.alignment
            let imageURL = decodedData.image.url
            let character = Character(name: name, publisher: publisher, alignment: alignment, imageURL: imageURL)

            return character

        } catch {
            print("Error with decoding data: \(error)")
        }
        return nil
    }
}

