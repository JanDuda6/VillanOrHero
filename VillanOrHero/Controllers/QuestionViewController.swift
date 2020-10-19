//
//  ViewController.swift
//  MarvelVillanOrHero
//
//  Created by Kurs on 27/08/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var questionNumberLabel: UILabel!
    @IBOutlet private weak var backGroundLabel: UILabel!
    
    var heroAlignment = ""
    var timer: Timer?
    var timePoints = 5.00

    var characterManager = CharacterManager()
    let questionManager = QuestionManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        characterManager.delegate = self
        characterManager.fetchCharacter()
        userName.text = questionManager.userName
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if questionManager.questionNumber == 5 {
            checkAnswerAndChangeUIColor(sender: sender)
            questionManager.addScoreToUserDefault(with: questionManager.userName, and: questionManager.userResult)
            questionManager.stopTimer()
            performSegue(withIdentifier: Constants.scoreVCSegue, sender: self)
        } else {
            checkAnswerAndChangeUIColor(sender: sender)
            characterManager.fetchCharacter()
            scoreLabel.text = "Score: \(questionManager.roundScore())"
            questionNumberLabel.text = "\(questionManager.questionNumber)/5"
            questionManager.stopTimer()

        }
    }
    func checkAnswerAndChangeUIColor(sender: UIButton) {
        if questionManager.checkAnswer(sender.accessibilityIdentifier!, characterAlignment: heroAlignment) {
            backGroundLabel.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.8745098039, blue: 0.6, alpha: 1)
            scoreLabel.font = UIFont.init(name: "Best Friends Font", size: 25)
            scoreLabel.textColor = #colorLiteral(red: 1, green: 0.831372549, blue: 0.4745098039, alpha: 1)
            scoreLabel.shadowOffset = CGSize(width: 2, height: 2)
            scoreLabel.shadowColor = .black
        } else {
            backGroundLabel.backgroundColor = #colorLiteral(red: 1, green: 0.2549019608, blue: 0.3019607843, alpha: 1)
        }
    }
}
//MARK: - Character delegate
extension QuestionViewController: CharacterManagerDelegate {
    func didReceiveCharacterUpdate(_ characterManager: CharacterManager, character: Character) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.scoreLabel.font = UIFont.init(name: "Chalkboard SE Regular", size: 19)
            self.scoreLabel.textColor = .black
            self.scoreLabel.shadowOffset = CGSize(width: 0, height: 0)
            self.backGroundLabel.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            self.questionLabel.text = character.name
            self.parseImage(from: character.imageURL)
            self.heroAlignment = character.alignment
        }
    }

    func parseImage(from url: String) {
        self.image.image = .none
        guard let imageURL = URL(string: url) else { return }

        if let imageData = try? Data(contentsOf: imageURL) {
            let image = UIImage(data: imageData)
            self.image.image = image
            questionManager.startTimer()
        } else {
            self.image.image = UIImage(systemName: Constants.SFSymbol)?.withTintColor(.black, renderingMode: .alwaysOriginal)
            questionManager.startTimer()
        }
    }
}

