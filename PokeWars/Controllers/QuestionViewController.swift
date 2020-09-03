//
//  ViewController.swift
//  PokeWars
//
//  Created by Kurs on 27/08/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    var heroAlignment = ""
    var user: User?

    var characterManager = CharacterManager()
    var questionManager = QuestionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        characterManager.delegate = self
        characterManager.fetchCharacter()
        userName.text = user?.name
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if questionManager.questionNumber == 5 {
            questionManager.checkAnswer(sender.currentTitle!, characterAlignment: heroAlignment)
            questionNumberLabel.text = "\(questionManager.questionNumber)/5"
            performSegue(withIdentifier: Constants.scoreVCSegue, sender: self)
        } else {
            questionManager.checkAnswer(sender.currentTitle!, characterAlignment: heroAlignment)
            characterManager.fetchCharacter()
            scoreLabel.text = "Score: \(questionManager.userResult)"
            questionNumberLabel.text = "\(questionManager.questionNumber)/5"
        }
    }
}

//MARK: - Character delegate

extension QuestionViewController: CharacterManagerDelegate {
    func didReceiveCharacterUpdate(_ characterManager: CharacterManager, character: Character) {
        DispatchQueue.main.async {
            self.questionLabel.text = character.name
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

