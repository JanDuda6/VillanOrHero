//
//  ScoreViewController.swift
//  MarvelVillanOrHero
//
//  Created by Kurs on 03/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet private weak var scoreLabel: UILabel!
    let questionManager = QuestionManager.sharedInstance

    override func viewDidLoad() {
        scoreLabel.text = "\(questionManager.userName)!\n you have scored \(questionManager.roundScore()) points"
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        questionManager.clearQuestionManager()
        self.navigationController?.popToRootViewController(animated: false)
    }
}
