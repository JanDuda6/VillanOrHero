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
                createUILabel(with: "\(scores.key)    \(scores.value)", and: counterY)
                counterY += 65
            }
        } else {
            createUILabel(with: "Empty", and: counterY)
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }

    func createUILabel(with text: String, and y: Int) {
        let scoreLabel = UILabel(frame: CGRect(x: 98, y: y, width: 222, height: 56))
        scoreLabel.text = text
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont.init(name: "Best Friends Font", size: 50)
        scoreLabel.textColor = .black
        scoreLabel.shadowOffset = CGSize(width: 2, height: 2)
        scoreLabel.shadowColor = .white
        self.view.addSubview(scoreLabel)
    }
}
