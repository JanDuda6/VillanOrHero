//
//  ScoreViewController.swift
//  PokeWars
//
//  Created by Kurs on 03/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    let questionManager = QuestionManager.sharedInstance

    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        scoreLabel.text = "\(questionManager.userName), you score: \(questionManager.userResult)"
        print(questionManager.tableScores)
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        questionManager.clearQuestionManager()
        self.navigationController?.popToRootViewController(animated: false)
    }
}
