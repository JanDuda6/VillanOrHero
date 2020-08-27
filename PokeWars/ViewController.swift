//
//  ViewController.swift
//  PokeWars
//
//  Created by Kurs on 27/08/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!

    let api = "https://pokeapi.co/api/v2/pokemon/1"

    override func viewDidLoad() {
        super.viewDidLoad()
        performSession(url: api)
    }

    func performSession(url: String) {
        if let urlData = URL(string: url) {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: urlData) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let dataJson = data {
                    print(self.parseJson(dataToDecode: dataJson))

                }
            }
            task.resume()
        }
    }


    func parseJson(dataToDecode: Data) -> Pokemon! {
        let decoder = JSONDecoder()

        do {
            let decodeData = try decoder.decode(Pokemon.self, from: dataToDecode)
            let characterName = decodeData.name
            return Pokemon(name: characterName)

        } catch {
            print(error)
        }

        return nil
    }

}


