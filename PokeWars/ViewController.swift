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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    var heroAlignment = ""

    var characterManager = CharacterManager()
    var questionManager = QuestionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        characterManager.delegate = self
        characterManager.fetchCharacter()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if questionManager.questionNumber == 5 {
            performSegue(withIdentifier: "scoreVC", sender: self)
        }
        questionManager.checkAnswer(sender.currentTitle!, characterAlignment: heroAlignment)
        characterManager.fetchCharacter()
        scoreLabel.text = "Score: \(questionManager.userResult)"
        questionLabel.text = "\(questionManager.questionNumber)/5"
    }

}

//MARK: - Character delegate

extension ViewController: CharacterManagerDelegate {
    func didReceiveCharacterUpdate(_ characterManager: CharacterManager, character: Character) {
        DispatchQueue.main.async {
            self.textLabel.text = character.name
            self.parseImage(from: character.imageURL)
            self.heroAlignment = character.alignment
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

