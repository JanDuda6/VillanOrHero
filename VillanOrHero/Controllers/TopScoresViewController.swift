//
//  TopScoresViewController.swift
//  MarvelVillanOrHero
//
//  Created by Kurs on 02/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class TopScoresViewController: UIViewController {

    @IBOutlet private weak var stackView: UIStackView!
    let questionManager = QuestionManager.sharedInstance
    var counterY = 0

    override func viewDidLoad() {
        if let topScore = questionManager.loadUserDefault()?.sorted(by: {$0.1 > $1.1}) {
            for scores in topScore {
                createUILabel(with: "\(scores.key)    \(String(format: "%.2f", scores.value))", and: counterY)
                counterY += 200
            }
        } else {
            createUILabel(with: "Empty", and: counterY)
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }

    func createUILabel(with text: String, and y: Int) {
        let scoreLabel = UILabel(frame: CGRect(x: 0, y: y, width: 984, height: 200))
        scoreLabel.text = text
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont.init(name: "Best Friends Font", size: 50)
        scoreLabel.adjustsFontSizeToFitWidth = true
        scoreLabel.minimumScaleFactor = 1
        scoreLabel.textColor = .black
        scoreLabel.shadowOffset = CGSize(width: 2, height: 2)
        scoreLabel.shadowColor = .white
        stackView.addArrangedSubview(scoreLabel)
    }
}
