//
//  TopScoresViewController.swift
//  PokeWars
//
//  Created by Kurs on 02/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class TopScoresViewController: UIViewController {

    let questionManager = QuestionManager.sharedInstance
    var counterY = 347

    override func viewDidLoad() {
        if let topScore = questionManager.loadUserDefault()?.sorted(by: {$0.1 > $1.1}) {
            for scores in topScore {
                createLabel(with: "\(scores.key) \(scores.value)", and: counterY)
                counterY += 65
            }
        } else {
            createLabel(with: "Empty", and: counterY)
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    func createLabel(with text: String, and y: Int) {
        let scoreLabel = UILabel(frame: CGRect(x: 98, y: y, width: 217, height: 57))
        scoreLabel.backgroundColor = #colorLiteral(red: 0.8706822395, green: 0.8706822395, blue: 0.8706822395, alpha: 1)
        scoreLabel.layer.cornerRadius = 5
        scoreLabel.text = text
        scoreLabel.textAlignment = .center
        self.view.addSubview(scoreLabel)
    }
}
