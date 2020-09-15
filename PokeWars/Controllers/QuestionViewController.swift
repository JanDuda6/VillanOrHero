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

    var characterManager = CharacterManager()
    var questionManager = QuestionManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        characterManager.delegate = self
        characterManager.fetchCharacter()
        userName.text = questionManager.userName
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if questionManager.questionNumber == 5 {
            questionManager.checkAnswer(sender.currentTitle!, characterAlignment: heroAlignment)
            questionNumberLabel.text = "\(questionManager.questionNumber)/5"
            questionManager.addScoreToUserDefault(with: questionManager.userName, and: questionManager.userResult)
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
        self.image.image = .none
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageURL) {
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.image.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self.image.image = UIImage(systemName: Constants.SFSymbol)
                }
            }
        }
    }
}

