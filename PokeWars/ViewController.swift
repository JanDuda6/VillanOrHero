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
    @IBOutlet weak var image: UIImageView!

    var characterManager = CharacterManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        characterManager.delegate = self
        characterManager.fetchCharacter()
    }
}
extension ViewController: CharacterManagerDelegate {
    func didReceiveCharacterUpdate(_ characterManager: CharacterManager, character: Character) {
        DispatchQueue.main.async {
            self.textLabel.text = character.name
            self.parseImage(from: character.imageURL)
        }
    }
    func parseImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image.image = image
            }
        }
    }
}

